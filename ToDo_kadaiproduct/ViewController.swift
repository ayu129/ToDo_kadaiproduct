//
//  ViewController.swift
//  ToDo_kadaiproduct
//
//  Created by 伊藤愛結 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList_Date.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.detailTextLabel?.text = todoList_Date[indexPath.row]
        cell?.textLabel?.text = todoList_Content[indexPath.row]
        cell?.detailTextLabel?.textColor = UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 1)
        return cell!
    }
    

    @IBOutlet var table: UITableView!
    
    var saveData: UserDefaults = UserDefaults.standard
    var todoList_Date = [String]()
    var todoList_Content = [String]()
    var todoDate: String!
    var todoContent: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource = self
        
        todoList_Date = saveData.array(forKey: "todo_Date") as? [String] ?? []
        todoList_Content = saveData.array(forKey: "todo_Content") as? [String] ?? []
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
        {
            return true
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCell.EditingStyle.delete {
            todoList_Date.remove(at: indexPath.row)
            todoList_Content.remove(at: indexPath.row)
            table.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            saveData.set(todoList_Date, forKey: "todo_Date")
            saveData.set(todoList_Content, forKey: "todo_Content")
        }
    }
    
    @IBAction func myUnwindAction(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        if unwindSegue.identifier == "backToFirst" {
            todoList_Date = saveData.array(forKey: "todo_Date") as? [String] ?? []
            todoList_Content = saveData.array(forKey: "todo_Content") as? [String] ?? []
            todoList_Date.append(todoDate)
            todoList_Content.append(todoContent ?? "")
            saveData.set(todoList_Date, forKey: "todo_Date")
            saveData.set(todoList_Content, forKey: "todo_Content")
            table.reloadData()
        }
    }
    
    
//    @IBAction func backToFirst(_ segue: UIStoryboardSegue) {
//
//    }



}

