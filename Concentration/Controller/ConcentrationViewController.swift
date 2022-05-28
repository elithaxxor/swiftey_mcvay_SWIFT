//
//  ViewController.swift
//  Concentration
//
//  Created by a-robota on 5/15/22.
//

import UIKit


struct err {
    
    var err = false
    switch err {
    case true :
        print("[Visibility Error]")
    case false :
        print("[Visibility Good]")
    }
}

@IBDesignable
class ConcentrationViewController : ViewControllerLogger {
    //  internal var flipCount: Int { get set }
    //    init (game: game)  {
    //        self.game = game
    //    }
    
    override var loggingNames : String {
        return " [START LOGGING MAIN VIEW CONTROLLER] "
    }
   //  var emojis: Array<String> = ["🤗","🥶","🤗","🥶","👻","👻","🤡","🤡"]
  //   var emojiChoices: Array<String> = ["🤗","🥶","🤗","🥶","👻","👻","🤡","🤡"]




    private  var emoji = [Card: String]()
    @IBInspectable
    var visibleCardButtons : [UIButton]! { return visibleCardButtons?.filter { !($0.superview?.isHidden ?? errMsg) }}

    @IBOutlet private weak var flipCountLabel: UILabel! { didSet { updateFlipCountLabel() } }


    @IBInspectable private var numberOfPairsCards : Int { get { return (visibleCardButtons.count + 1) / 2 } }
    @IBInspectable private(set) var flipCount = 0 { didSet { updateFlipCountLabel(); flipCountLabel.text = "Flips \(flipCount)" }}
    private lazy var game: Concentration = Concentration(numberOfPairCards: numberOfPairsCards)



    @IBInspectable private var themeChooser = ConcentrationThemeChooserViewController()
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key : Any] = [
            .strokeWidth : 5.0,
            //  .strokeColor : .black
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }

    @IBAction private func touchCard(_ sender : UIButton) {
        flipCount += 1
        if let cardNumber = visibleCardButtons.firstIndex(of: sender) {
            print("card number \(cardNumber) selected")
            game.chooseCard(at: cardNumber)
            updateFromModel()
        } else {
            print("Touchcard not possible")
        }
    }

    // MARK: handle shuffle
    private func updateFromModel() {
        print("[\(flipCount)] card is flipped ")
        if visibleCardButtons != nil {
            for index in visibleCardButtons.indices {
                let button = visibleCardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp {
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = .systemGreen
                } else {
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = .systemBlue
                }
            }
        }
    }


//    // MARK: Emoji choice logic
//    private func emoji(card: Card) -> String {
//        if emoji[card] == nil, emojis.count > 0 {
//            let randomStringIdx = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
//            emoji[card] = String(emojiChoices.remove(at: randomStringIdx)) // arc4random in extension
//        }
//        return emoji[card] ?? "?"
//    }
//
//    // MARK: IB/UI Functionality
//
//
//    public var theme : String = "" {
//        didSet {
//            var chosenTheme = ConcentrationThemeChooserViewController.changeTheme(ConcentrationThemeChooserViewController)
//
//            emoji = [:]
//            updateFromModel()
//        }
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
}
// MARK: Extension
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

extension ViewController {
    func createLogFile() {
        if let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let fileName = "\(Date()).log"
            let logFilePath = (documentsDirectory as NSString).appendingPathComponent(fileName)

            freopen(logFilePath.cString(using: String.Encoding.ascii)!, "a+", stderr)

        }
    }

    
}





//    private(set) var flipCount : Int = 0 {
//        didSet {
//            flipCountLabel.text = "Flips \(flipCount)"
//            updateFlipCountLabel() // NSATTRIBUTE TO CHANGE VIEW DESIGN
//        }
//}



