	//
	//  ViewController.swift
	//  yetAnotherTODO
	//
	//  Created by a-robot on 4/25/22.
	//


	// [Creates Object]	let newItem = ToDoListItem(context: context)

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
		// Intemediarary for CoreData
	private var modelsArray = [ToDoListItems]()

	
		// [CoreData Context Manager)
	let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return modelsArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let model = modelsArray[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = context.name
		return cell
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "yet another TODO LIST"
		
			// [TableView]
		view.addSubview(tableView)
		getItems()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.frame = view.bounds
		
			// [Navigation Views]
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
												  target: self,
												  action: #selector(didTapAdd))
	}
	
	
	@objc private func didTapAdd(){
		let alert = UIAlertController(title: "New Item",
								message: "Add New Item",
								preferredStyle: .alert)
		alert.addTextField(configurationHandler: nil)
		alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
			guard let textField = alert.textFields?.first, let text = textField.text, !text.isEmpty else {
				return
			}
			self?.createItem(name: text)
			
		}))
		present(alert, animated: true)
	}
	
	
	
	
		// [TableView Properites]
	let tableView: UITableView = {
		let table = UITableView()
		table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		return table
	}()
	

	
		//[CORE DATA ]
		// [GET]
	func getItems() {
		do {
			let modelsArray = try context.fetch(ToDoListItems.fetchRequest())
			
			DispatchQueue.main.async{
				self.tableView.reloadData()
			}
		}
		catch {
			print(error)
		}
	}
	
	func createItem(name: String) {
	//[OBJ Instantiation]
		let newItem = ToDoListItems(context: context)
		newItem.name = name
		newItem.createdAt = Date()
		
			// [Save to CoreDB)
		do {
			try context.save()
			getItems()
			
		} catch {
			print(error)
		}
	}
	
	func deleteItem(item: ToDoListItems) {
		context.delete(item)
		
		do {
			try context.save()
		} catch {
			print(error)
		}
		
	}
	
	func updateItem(item: ToDoListItems){
		
		// item.name = newName
		do {
			try context.save()
		} catch {
			print(error)
		}
	}
}

