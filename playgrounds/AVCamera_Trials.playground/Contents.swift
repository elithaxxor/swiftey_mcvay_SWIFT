import UIKit
import AVFoundation

class CameraService {
    var session: AVCaptureSession?
    var delgate: AVCapturePhotoCaptureDelegate?
    
    let output = AVCapturePhotoOutput()
    let previewLayer =  AVCaptureVideoPreviewLayer()
    
    func start(delegate: AVCapturePhotoCaptureDelegate, completion: @escaping (Error?) -> ()) {
        print("starting camera capture")
        self.delegate = delegate
    }
    
    private func checkPermissions(completion: @escaping (Error?) ->()) {
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .restricted:
            print("[!] AV Restricted")
            break
        case .denied:
            print("[!] AV Denied")
            break
        case .notDetermined:
            print("[!] AV Cannot Be Found")
            
        case .authorized:
            print("[+] AV Authorized")
            setupCamera(completion: completion)
        @unknown default:
            break
        }
        
    }
    func setupCamera(completion: @escaping ) {
    let session = AVCaptureSession()
    
}
}

