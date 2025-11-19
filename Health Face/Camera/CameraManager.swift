//
//  CameraManager.swift
//  Health Face
//
//  Created by Damir Aushenov on 18/11/25.
//

import AVFoundation
import Combine

class CameraManager: ObservableObject {
    enum Status {
        case unconfigured
        case configured
        case unauthorized
        case failed
    }
    
    enum CameraError: Error {
        case cameraUnavailable
        case cannotAddInput
        case cannotAddOutput
        case deniedAuthorization
        case restrictedAuthorization
        case unknownAuthorization
        case thrownError(message: Error)
    }
    
    @Published var error: CameraError?
    
    let session = AVCaptureSession()
    
    static let shared = CameraManager()
    
    private let sessionQueue = DispatchQueue(label: "com.yespeace.SessionQ")
    
    private let videoOutput = AVCaptureVideoDataOutput()
    
    private var status = Status.unconfigured
    
    func set(_ delegate: AVCaptureVideoDataOutputSampleBufferDelegate, queue: DispatchQueue) {
        sessionQueue.async {
            self.videoOutput.setSampleBufferDelegate(delegate, queue: queue)
        }
    }
    
    private func setError(_ error: CameraError?) {
        DispatchQueue.main.async {
            self.error = error
        }
    }
    
    private init() {
        configure()
    }
    
    private func configure() {
        self.checkPermissions()
        sessionQueue.async {
            self.configureCaptureSession()
            self.session.startRunning()
        }
    }
    
    private func configureCaptureSession() {
        guard status == .unconfigured else {
            return
        }
        
        session.beginConfiguration()
        defer {
            session.commitConfiguration()
        }
        
        let device = AVCaptureDevice.default(
            .builtInWideAngleCamera,
            for: .video,
            position: .back
        )
        guard let camera = device else {
            setError(.cameraUnavailable)
            status = .failed
            return
        }
        
        do {
            let cameraInput = try AVCaptureDeviceInput(device: camera)
            
            if session.canAddInput(cameraInput) {
                session.addInput(cameraInput)
            } else {
                setError(.cannotAddInput)
                status = .failed
                return
            }
        } catch {
            debugPrint(error)
            setError(.thrownError(message: error))
        }
        
        if session.canAddOutput(videoOutput) {
            session.addOutput(videoOutput)
            
            videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
            let videoConnection = videoOutput.connection(with: .video)
            videoConnection?.videoOrientation = .portrait
        } else {
            setError(.cannotAddOutput)
            status = .failed
            return
        }
        
        status = .configured
    }
    
    private func checkPermissions() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        
        case .notDetermined:
            sessionQueue.suspend()
            AVCaptureDevice.requestAccess(for: .video) { authorized in
                if !authorized {
                    self.status = .unauthorized
                    self.setError(.deniedAuthorization)
                }
                
                self.sessionQueue.resume()
            }
        case .restricted:
            status = .unauthorized
            setError(.restrictedAuthorization)
        case .denied:
            status = .unauthorized
            setError(.deniedAuthorization)
        case .authorized:
            break
        @unknown default:
            status = .unauthorized
            setError(.unknownAuthorization)
        }
    }
}
