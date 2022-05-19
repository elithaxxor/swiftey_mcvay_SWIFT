//
//  ViewController.swift
//  ToDo_List
//
//  Created by a-robota on 4/19/22.
//

import UIKit

class TodoViewController: UITableViewController  {
    
    let things = ["one", "two", "three"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    // datasource methods for table lview
    // unpacks # of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return things.count
    }
    
    // unpacks array items
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = things[indexPath.row]
        return cell
    }
    
    // tableview delegate methods
    
    //[debugging]
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        print(things[indexPath.row])
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark // for checkmark to persist (checkmark icon initilized in storyboard)
        tableView.deselectRow(at: indexPath, animated: true) // [UI] --> bool for cell highligting.
         
        
    }
}

