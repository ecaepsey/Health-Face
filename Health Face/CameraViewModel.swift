//
//  CameraViewModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 19/11/25.
//

import CoreImage

 class ContentViewModel: ObservableObject {

    @Published var frame: CGImage?
    @Published var error: Error?

    private let cameraManager = CameraManager.shared

    private let frameManager = FrameManager.shared

    init() {
        setupSubscriptions()
    }

    func setupSubscriptions() {
        cameraManager.$error
          .receive(on: RunLoop.main)
          .map { $0 }
          .assign(to: &$error)

        frameManager.$current
            .receive(on: RunLoop.main)
            .compactMap { buffer in
                if buffer != nil {
                    let inputImage = CIImage(cvPixelBuffer: buffer!)
                    let context = CIContext(options: nil)
                    return context.createCGImage(inputImage, from: inputImage.extent)
                } else {
                    return nil
                }
            }
            .assign(to: &$frame)
    }
}
