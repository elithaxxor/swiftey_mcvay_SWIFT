//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        
        
        guard let image = UIImage(named: "Image") else { return }
        let imageView = UIImageView(image: image)
        
        
        //[Frame]
        imageView.contentMode = .scaleAspectFit
        let scaledHeight = view.frame.width / image.size.width * image.size.height // to scale the height
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scaledHeight)
        imageView.backgroundColor = .black
        
        view.addSubview(imageView)
    
        
        // [Request for facial detection]
        // VNDetectFaceRectanglesRequestRevision3
        
        let request = VNDetectFaceRectanglesRequest { (request, err) in
            if let err = err {
                print("Failed to capture face", err)
                return
            }
            print("[+] Facial Request Completed \(request) \(Date())")
           
                //.. loop through rsults, each response corrosponds to a new face
                request.results?.forEach({ (response) in
                    print("[+] response recvd \(response)")
                    
                    guard let faceObservation = response as? VNFaceObservation else { return }
                   // guard let faceLandmark = response as? VNFaceLandmarks2D else { return }
                    
                    let x = self.view.frame.height * faceObservation.boundingBox.origin.x
                    let w = self.view.frame.width * faceObservation.boundingBox.width
                    let h = scaledHeight * faceObservation.boundingBox.height
                    let y = scaledHeight * (1 - faceObservation.boundingBox.minY) - h

                    let redView = UIView()
                    redView.backgroundColor = .red
                    redView.frame = CGRect(x:x, y: 0, width: w, height: h)
                    self.view.addSubview(redView)
                
                    print("[!] Face Positions")
                    print("[x: \(x) y: \(y) width: \(w) height: \(h)")
                    
                    
                    
                    
                    
        
        
        
        
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
        
        
        //[Frame]
        imageView.contentMode = .scaleAspectFit
        let scaledHeight = view.frame.width / image.size.width * image.size.height // to scale the height
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scaledHeight)
        imageView.backgroundColor = .black
        
        view.addSubview(imageView)
        
        guard let faceObservation = response as? VNFaceObservation else { return }
        guard let faceLandmark = response as? VNFaceLandmarks2D else { return }
        let x = self.view.frame.height * faceObservation.boundingBox.origin.x
        let w = self.view.frame.width * faceObservation.boundingBox.width
        let h = scaledHeight * faceObservation.boundingBox.height
        let y = scaledHeight * (1 - faceObservation.boundingBox.y) - h

        
        let redView = UIView()
        redView.backgroundColor = .red
        redView.frame = CGRect(x:x, y: 0, width: w, height: h)
        self.view.addSubview(redView)
    
        print("[!] Face Positions")
        print("[x: \(x) y: \(y) width: \(w) height: \(h)")
        
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
