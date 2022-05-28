
	//  ViewController.swift
	//  inAppPurchaseQuotes
	//
	//  Created by a-robot on 4/25/22.
	//

import UIKit
import StoreKit


class QuoteTableViewController: UITableViewController, SKPaymentTransactionObserver {

	
	
	let productID = "com.londonappbrewery.InspoQuotes.PremiumQuotes"
	
	var quotesToShow = [
		"Our greatest glory is not in never falling, but in rising every time we fall. — Confucius",
		"All our dreams can come true, if we have the courage to pursue them. – Walt Disney",
		"It does not matter how slowly you go as long as you do not stop. – Confucius",
		"Everything you’ve ever wanted is on the other side of fear. — George Addair",
		"Success is not final, failure is not fatal: it is the courage to continue that counts. – Winston Churchill",
		"Hardships often prepare ordinary people for an extraordinary destiny. – C.S. Lewis"
	]
	
	let premiumQuotes = [
		"Believe in yourself. You are braver than you think, more talented than you know, and capable of more than you imagine. ― Roy T. Bennett",
		"I learned that courage was not the absence of fear, but the triumph over it. The brave man is not he who does not feel afraid, but he who conquers that fear. – Nelson Mandela",
		"There is only one thing that makes a dream impossible to achieve: the fear of failure. ― Paulo Coelho",
		"It’s not whether you get knocked down. It’s whether you get up. – Vince Lombardi",
		"Your true success in life begins only when you make the commitment to become excellent at what you do. — Brian Tracy",
		"Believe in yourself, take on your challenges, dig deep within yourself to conquer fears. Never let anyone bring you down. You got to keep going. – Chantal Sutherland"
	]
	
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if isPurchased() {
			SKPaymentQueue.default().add(self)
		}
	}
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return quotesToShow.count + 1}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath)
		
		
		// [To Display Free Quotes]
		if indexPath.row < quotesToShow.count {
			cell.textLabel?.text = quotesToShow[indexPath.row]
			cell.textLabel?.numberOfLines = 0
			cell.textLabel?.textColor = .yellow
			cell.accessoryType = .none // lets user know a tap will = action

		} else { // [For Premium ViewCells]
			cell.textLabel?.text = "Get More Quotes [pay]"
			cell.textLabel?.textColor = .blue
			cell.accessoryType = .disclosureIndicator // lets user know a tap will = action
		}
		return cell
		
	}
	
	
	
	// [Delegate]
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		if indexPath.row == quotesToShow.count {
			print("Buy Quotes Clicked")
			buyPremiumQuotes()
		}
		tableView.deselectRow(at: indexPath, animated: true) // to deselect "get more quotees button"
	}
	
	func buyPremiumQuotes() {
		// [1. Check if user is able to make purhcase]
		if SKPaymentQueue.canMakePayments(){
			print("user can make  purchases")
			
			let paymentRequest = SKMutablePayment()
			paymentRequest.productIdentifier = productID
			SKPaymentQueue.default().add(paymentRequest)
			
		} else {
			print("user cannot make purchases")
		}
	}
	

		// [payments]
	
	// an array is created in the payment stack, the loop will check for succesfull/unsuccessfull purchases
	func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
		for transaction in transactions {
			if transaction.transactionState == .purchased {
				print("transaction accepted \(transaction)")
				SKPaymentQueue.default().finishTransaction(transaction)
				showPremiumQuotes()
				
				// [For Payment ID]
				SKPaymentQueue.default().finishTransaction(transaction)
				
			}
			else if transaction.transactionState == .failed {

				if let error = transaction.error {
					let errorDescription = error.localizedDescription
					print("transaction accepted \(transaction)")
					print(errorDescription)
	
				}
			}
			else if transaction.transactionState == .restored {
				showPremiumQuotes()
				print("tranasction restored \(transaction)")
				// hide the "restore" btn once previous purchase is restored
				navigationItem.setRightBarButton(nil, animated: true)
				SKPaymentQueue.default().finishTransaction(transaction)
				
			}
		}
		
	}
	
	func showPremiumQuotes()  {
		UserDefaults.standard.set(true, forKey: productID)
		quotesToShow.append(contentsOf: premiumQuotes)
		tableView.reloadData()
		
	}
	
	func isPurchased() -> Bool {
		let pStatus = UserDefaults.standard.bool(forKey: productID)
		
		if pStatus {
			print("Purchase Status\(pStatus)")
			return true
		}
		else  {
			print("Purchase Status\(pStatus)")
			return false
	}
}

	@IBAction func Restore(_ sender: UIButton) {
		SKPaymentQueue.default().restoreCompletedTransactions()
		
	}
}
