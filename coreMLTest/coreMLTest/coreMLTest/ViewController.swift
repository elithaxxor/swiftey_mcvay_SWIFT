//
//  ViewController.swift
//  coreMLTest
//
//  Created by a-robota on 4/28/22.
// DO NOT FORGET TO CHANGE INFO.PLIST FOR CAMERA/PHOTO ACCESS

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera // for camera icon
        imagePicker.sourceType = .photoLibrary // for accessing user photo library
        imagePicker.allowsEditing = true // allow user to edit
        
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let userPickedImage = info [UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage {
            imageView.image = userPickedImage
            //[start of Core-ML]
            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("Cannot convert UIImage to CIImage (camera capture to ML modelling")
            }
            imagePicker.dismiss(animated: true, completion: nil)
            detect(image: ciimage)
            
            
        }
    }
    
    
    
    
    
    /// reads image meta data for snap-prediction
    func detect(image: CIImage) {
        /// [model build, if not nil]
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Error in creating Models [Core-ML] data.")
        }
        /// [model processing]
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Error in Processing Model")
            }
            print(results)
            
            // [to display results on navbar]
            if let firstResult = results.first {
                if firstResult.identifier != nil {
                    
                }
            }
            // [model classification]
            let handler = VNImageRequestHandler(ciImage: image)
            do {
                //.. calls request ^
                try handler.perform([request])
            } catch {
                print("Error in model classification \(error)")
            }
        }
        
    }
    
    
    @IBAction func cameraBtn(_ sender: UIBarButtonItem) {
        print("camera btn pressed")
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func LibraryBtn(_ sender: UIBarButtonItem) {
        print("library btn pressed")
        present(imagePicker, animated: true, completion: nil)
    }
    
    
}
