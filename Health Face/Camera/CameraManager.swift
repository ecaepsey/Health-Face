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
    }
    
    enum CameraError: Error {
        
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
        sessionQueue.async {
            self.session.startRunning()
        }
    }
}
