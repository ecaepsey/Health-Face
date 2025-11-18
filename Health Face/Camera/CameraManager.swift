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
        
    }
    
    enum CameraError: Error {
        
    }
    
    @Published var error: CameraError?
    
    let session = AVCaptureSession()
}
