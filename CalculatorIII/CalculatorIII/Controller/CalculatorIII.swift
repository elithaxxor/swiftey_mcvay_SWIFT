	//
	//  ViewController.swift
	//  CalculatorIII
	//
	//  Created by a-robot on 4/26/22.
	//

import UIKit

class CalculatorIII: UIViewController {
	
	let Logic = operandLogic() // clear, +/- and modulo
	
	private var isFinishedTypingNumber: Bool = true
	@IBOutlet weak var DisplayView: UILabel!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func logicBtnTap(_ sender: UIButton) {
		
		isFinishedTypingNumber = true
		
			// [convert to double, check if nill'
		guard let number = Double(DisplayView.text!) else {
			fatalError("Cannot Convert Display values. ")
		}
		print(number)
		
			// [Operand Buttons]
		if let calcMethod = sender.currentTitle {
			if calcMethod == "+/-" {
				var reversedNum = Logic.reverseNum(reverse: number)
				print("Reversed Num = \(reversedNum)")
				DisplayView.text = String(reversedNum)
			}
			
			if calcMethod == "AC" {
				var clearStr = String(number)
				var clearedView = Logic.clearView(clear: clearStr)
				print("clearing..")
				DisplayView.text = clearedView
			}
			if calcMethod == "%" {
				var modNum = Logic.modNum(mod: number)
			}
			
			if calcMethod == "." {
				guard let decVal = Double(DisplayView.text!) else {
					fatalError("Could not validate num for \(DisplayView.text)")
				}
				var decimalNum = Logic.handleDecimal(num: number)
			}
			if calcMethod == "+" {
				var calcStr = String(number)
				Logic.calculate(value: calcStr, operand: "+")
			}
			if calcMethod == "-" {
				var calcStr = String(number)

				Logic.calculate(value: calcStr, operand: "-")
				
			}
			if calcMethod == "*" {
				var calcStr = String(number)

				Logic.calculate(value: calcStr, operand:  "*")
				
			}
			if calcMethod == "/" {
				var calcStr = String(number)

				Logic.calculate(value: calcStr, operand: "/")
			}
			
			
			
			
			
				//var displayNum = Double(DisplayView.text)
			if let displayNum = Double(DisplayView.text!) {
				print("Could Display Number, exiting function \(DisplayView.text)")
				var strDisplay = String(displayNum)
				DisplayView.text = strDisplay
			}
			
			else {
				print("Could Display Number, exiting function \(DisplayView.text)")
				var strDisplay = String(number)
				DisplayView.text = strDisplay
			}
			
			print(DisplayView.text)
		}
		
		
	}
	
	
	@IBAction func numBtnTap(_ sender: UIButton) {
		print("User Tapped \(sender)")
		if let val = sender.currentTitle {
			if isFinishedTypingNumber == true {
				DisplayView.text = val
				isFinishedTypingNumber = false
			}
			else { // appends additional digits to display
				DisplayView.text = DisplayView.text! + val
			}
		}
	}
}



