import UIKit
import Foundation
import PlaygroundSupport // for playgorund viwes
import SwiftUI

// Store key Object in UserDefaults

var greeting = "Hello, playground"

class Preferences {
    static let shared = Preferences()
    
    @Published var isPurchased: Bool = UserDefaults.standard.bool(forKey: "is_purchased") {
        
        didSet {
            print("old value \(oldValue)")
            UserDefaults.standard.set(isPurchased, forKey: "is_purchased")
        }
    }
}

struct ContentView: View
{
    var p = Preferences()
    
    @ObservedObject var preferences = Preferences.shared
    
    var body: some View
    {
        Text(preferences.isPurchased ? "Purchased" : "Not Purchased")
            .onTapGesture {
                preferences.isPurchased = true
            }
    }
}



print(Preferences.shared.isPurchased)
Preferences.shared.isPurchased = true
print(Preferences.shared.isPurchased)

PlaygroundPage.current.setLiveView(ContentView())
