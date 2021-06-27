//
//  TodoListViewController.swift
//  CoreDataDemo
//
//  Created by ganesh padole on 27/06/21.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        
        return cell
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        var textField = UITextField()
        
        let alertController = UIAlertController(title: "Add New ToDoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
        
            let item = Item(context: self.context)
            item.title = textField.text
            
            self.saveItem()
        }
        
        alertController.addTextField { alertTextField in
            textField = alertTextField
            textField.placeholder = "Add Item"
        }
        
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    func saveItem() {
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
