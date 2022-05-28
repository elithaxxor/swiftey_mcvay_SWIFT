//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by a-robota on 5/21/22.
//

import UIKit

class ConcentrationThemeChooserViewController: ViewControllerLogger, UISplitViewControllerDelegate {
    
    override var loggingNames : String {
        return " [START LOGGING MAIN THEME CONTROLLER] "
    }
    
    @IBAction func changeTheme(_ sender: Any) {
        performSegue(withIdentifier: "theme", sender: sender)
    }
    
    
    // MARK: Segue choices for Theme
    let themes = [
        "Sports" : "⚽️🏀🏈⚾️🥎🎾🏐🏉🥏",
        "Animals" : "🐶🐱🐭🐹🐻🐰🐼🐮🐷",
        "Faces" : "😀🥹😇🤣🙃🤪🤓😎🥸"
    ]
    
    
    //    init(themes: Dictionary[String : String]) {
    //        self.themes = themes
    //    }
    
    // MARK: Function to split viewController
    func splitViewController (
        _ splitViewController : UISplitViewController,
        collapseSecondary secondaryViewController : UIViewController,
        onto primaryViewController : UIViewController
    ) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.themes == nil {
                return true
            }
        }
        return false
    }
    
    // MARK: ViewController Segue Prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ){
        // MARK: Theme Segue Destination
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }
    
}
