//
//  ViewController.swift
//  CalculatorII
//
//  Created by a-robota on 4/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var top_table: UILabel!
    @IBOutlet weak var Results: UILabel!
    
    var maths: String = ""
    
    
    private func clearDisplay()
    {
        maths = ""
        top_table.text = ""
        Results.text = ""
    }
    
    private func addMaths(value: String){
        maths = maths + value;
        top_table.text = maths
    }
    
    private func formatResults(result: Double) -> String
    {
        
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    func allowedChars (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearDisplay()

        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func Seven(_ sender: Any) {
        
    }
    
    
    @IBAction func Eight(_ sender: Any) {
        addMaths(value: "8")
        
    }
    
    @IBAction func Nine(_ sender: Any) {
        addMaths(value: "9")
        
    }
    
    @IBAction func Five(_ sender: Any) {
        addMaths(value: "5")
        
    }
    
    @IBAction func Six(_ sender: Any) {
        addMaths(value: "6")
        
    }
    @IBAction func Four(_ sender: Any) {
        addMaths(value: "4")
        
    }
    
    @IBAction func One(_ sender: Any) {
        addMaths(value: "1")
        
    }
    @IBAction func Two(_ sender: Any) {
        addMaths(value: "2")
        
    }
    @IBAction func Threee(_ sender: Any) {
        addMaths(value: "3")
        
    }
    
    
    @IBAction func Percent(_ sender: Any) {
        addMaths(value: "%")
    }
    @IBAction func Divide(_ sender: Any) {
        addMaths(value: "/")
        
    }
    
    @IBAction func Zero(_ sender: Any) {
        addMaths(value: "0")
    }
    
    @IBAction func Clear(_ sender: Any) {
        clearDisplay()
    }
    @IBAction func Back(_ sender: Any) {
        
    }
    
    @IBAction func Multiply(_ sender: Any) {
        addMaths(value: "*")
        
    }
    @IBAction func Decimal(_ sender: Any) {
        addMaths(value: ".01")
        
    }
    // all work gets parsed here
    @IBAction func Equals(_ sender: Any) {
        if (validInput()){
            
            let checkedPercentage = maths.replacingOccurrences(of: "%", with: "*0.01")
            let expr = NSExpression(format: checkedPercentage)
            let NotFormattedResult = expr.expressionValue(with: nil, context: nil) as! Double
            print(NotFormattedResult )
            
            
            
            
            var finalResults = formatResults(result: NotFormattedResult)
            print(finalResults)
            Results.text = finalResults
            
            
            
        } else
        {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Invalid input, try again",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() ->  Bool{
        var count = 0
        var charIdx = [Int] ()
        
        // check if valid input is in text
        for char in maths {
            if(specialChar(char: char)){
                charIdx.append(count)
            }
            count += 1
            
        }
        var previous: Int = -1
        
        for index in charIdx
        {
            if(index == 0)
            {
                return false
            }
            
            if(index == maths.count - 1)
            {
                return false
            }
            
            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    
    func specialChar (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    
    
    
    
}

