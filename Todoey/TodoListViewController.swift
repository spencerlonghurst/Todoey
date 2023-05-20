//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ↓ ↓ ↓ This is to get around the bug of styling the top navigaton bar ↓ ↓ ↓
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        // ↑ ↑ ↑
    }
    
    //MARK: - Tableview Datasource Methods
    
    // ↓ ↓ ↓ This tableView says how many rows there should be in the tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // ↓ ↓ ↓ This tableView targets the correct cell and what should be in it. The "ToDoItemCell" comes from the Table View Cell Identifer
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }

    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        // ↓ ↓ ↓ This logic says to put a checkmark on and off on the tableview row
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        // ↑ ↑ ↑
        
        // ↓ ↓ ↓ This shows the tableView row to be selected with a gray background but then slowly animate back to a normal white row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        // ↓ ↓ ↓ The UIAlertController is the little box that pops up like an Apple alert
        let alert = UIAlertController(title: "Add New Todoy Item", message: "", preferredStyle: .alert)
        
        // ↓ ↓ ↓ The UIAlertAction is what the button says when the alert pops up and is the code to determine what happens after that button is tapped
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user taps the "Add Item" button
//            print(textField.text)
            
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        // ↓ ↓ ↓ You need to addTextField to the alert otherwise it is just going to be an empty alert/just a message
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        // ↓ ↓ ↓ The action has to be added to the alert
        alert.addAction(action)
        
        // ↓ ↓ ↓ The present will show the alert. The "alert" is the UIAlertController and it is the box to be shown to the user
        present(alert, animated: true, completion: nil)
        
    }
}

