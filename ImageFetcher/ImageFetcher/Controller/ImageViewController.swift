//
//  ViewController.swift
//  ImageFetcher
//
//  Created by a-robota on 5/22/22.
//

import UIKit

@IBDesignable
class ImageViewController: ViewControllerLogger, UIScrollViewDelegate {

    override var loggingNames : String {
        return " [START LOGGING MAIN VIEW CONTROLLER] "
    }


    @IBInspectable
    var imageView = UIImageView()


    //  @IBOutlet weak var imageView: UIImageView!
    @IBInspectable
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    // MARK: fetches image URL from models and calls fetch function
    @IBInspectable
    var imageURL: URL? {
        didSet {
            imageView.image = nil
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            if view.window != nil {
                fetchImage()
            }
        }
    }

    // MARK: Sets The Image on Views; Stops Spinner
    @IBInspectable
    private var image : UIImage? {
        get {
            return imageView.image
        }
        set { // MARK: Image has been set
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }


    @IBInspectable
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0

            scrollView.delegate = self
            scrollView.addSubview(imageView)

        }
    }

    private func fetchImage() {
        // MARK: Check if defined URL [from
        if let url = imageURL {
            do {
                spinner.startAnimating()
                print("[+] Starting Image Fetch \(url)")
                //MARK: QOS thread to fetch image data
                DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                    let imgData = try? Data(contentsOf: url)

                    DispatchQueue.main.async {
                        if let fetchedData = imgData, url == self?.imageURL {
                            self?.image = UIImage(data: fetchedData)
                        }
                    }
                }
            }
            catch let error {
                print("Error in fetch \(error)")
            }
        }
    }
    
    // MARK: UIScrollViewDelegate [Start]
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = URLS.URL02
        }
    }
}


