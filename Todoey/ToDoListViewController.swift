//
//  ViewController.swift
//  Todoey
//
//  Created by Thomas Chan on 30/11/2019.
//  Copyright © 2019 Thomas Chan. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggos", "Destory Demogrogon"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
            //set the array to display user defauly and typecast it as String
            //use optional binding since it would crash if user default is nil
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    } //# of rows
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        //it's reusing the cell. So when we scroll down, the checkmark will appear in the last new cell that appeared in the screen (since the first one is destroyted and now reallocate the cell the the last)
        //So we need to assign the checkmark to the data, not the cell
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        //the cell will return to the TableView and display as a row
        
        
    } //resuable cell
    
    //MARK: - Tableview Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
    }
    
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        //create a global variable
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item buton on our UIAlert
            self.itemArray.append(textField.text!)
            //as we are inside a closure, we need to tell the handler where the itemArray is (i.e. self, this current ViewController)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            //user default saved in P-list, that's why it has to be key-value pair, need the key to retreieve the value. 
            
            
            self.tableView.reloadData()
            //need to reloadData to show new item in tableview
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            //this is what happens when we click the "+" sign
            //turn the local variable of altertextfield into a global variable since it only exists in this closure before
        }
        
        
        
        alert.addAction(action)
        present(alert,animated: true, completion: nil)
    }
    
    
}






//        var newText:String?
//
//        alert.addTextField { (alertTextField) in
//            alertTextField.placeholder = "Create New Item"
//            newText = alertTextField.text
//        }
//
//        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
//            //what will happen once the user clicks the Add Item buton on our UIAlert
//            print("Success")
//            print(newText)
//        }
//
