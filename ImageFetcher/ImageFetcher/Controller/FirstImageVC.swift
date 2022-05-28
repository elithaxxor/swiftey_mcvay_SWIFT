//
//  FirstImageVC.swift
//  ImageFetcher
//
//  Created by a-robota on 5/22/22.
//

import UIKit

@IBDesignable
class FirstImageVC: ViewControllerLogger {
    override var loggingNames : String {
        return " [START LOGGING MAIN VIEW CONTROLLER] "
    }
    //MARK: StoryBoard Segue --> First Img ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // MARK: Segue to go to Nav Controller from choices
        if let identifier = segue.identifier {
            if let url = URLS.moreURLS[identifier] {
            //   let destination = segue.destination

                // without extension
               //if let seg2nav = destination as? UINavigationController {

                if segue.destination.contents is ImageViewController {
                   //
                   if let imageVC = segue.destination.contents as? ImageViewController {
                        imageVC.imageURL = url
                        imageVC.title = (sender as? UIButton)?.currentTitle
                    }

                }


                // MARK: [incase mistake is made]; remove nav controler and segue to imageviewcontroller

                if segue.destination == nil {
                    var destination = segue.destination
                    print("[!] Skipping NavBar Segue")
                    if let url = URLS.moreURLS[identifier] {
                        if let imageVC = segue.destination as? ImageViewController {
                            imageVC.imageURL = url
                            imageVC.title = (sender as? UIButton)?.currentTitle
                        }
                    }
                }
            }
        }
    }
}


extension UIViewController {
    var contents: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
