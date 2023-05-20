//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["find Mike", "Buy Eggos", "Destroy Demogorgon"]

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
    //TODO: -
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
    

}

