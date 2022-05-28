//
//  ViewController.swift
//  imageDropper
//
//  Created by a-robota on 5/24/22.
//

import UIKit

class imageDropperViewController: UIViewController, UIDropInteractionDelegate {

    @IBOutlet var imageView: UIView!{ didSet { imageView.addInteraction(UIDropInteraction ( delegate : self )) }}

    // MARK:
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass : NSURL.self) && session.canLoadObjects(ofClass:UIImage.self)
    }

    // MARK :
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropProposal) -> UIDropSession {
        return UIDropProposal(operation: .copy) as! UIDropSession
    }

    // MARK: To let go of object
    var imageFetcher: imageFetcher!

    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        imageFetcher = imageFetcher() { url, image  in
        DispatchQueue.main.async {
            self.imageFetcher.fetch(url)

        }
        }
        session.loadObjects(ofClass: NSURL.self) { nsurls in
            if let url = self.imageFetcher.fetch(url)
    }
        session.loadObjects(ofClass: UIImage.self) { images in
           if let image = self.imagFetcher.backup = image
        }
    }


    @IBOutlet weak var ArtView: imageDropperView!



    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

