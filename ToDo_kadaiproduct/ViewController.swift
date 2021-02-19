//
//  ViewController.swift
//  ToDo_kadaiproduct
//
//  Created by 伊藤愛結 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
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
    
    //編集の許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    //削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCell.EditingStyle.delete {
            todoList_Date.remove(at: indexPath.row)
            todoList_Content.remove(at: indexPath.row)
            table.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            saveData.set(todoList_Date, forKey: "todo_Date")
            saveData.set(todoList_Content, forKey: "todo_Content")
        }
    }
    
    //並び替え
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            // TODO: 入れ替え時の処理を実装する（データ制御など）
        let moveDate = todoList_Date[sourceIndexPath.row]
        todoList_Date.remove(at: sourceIndexPath.row)
        todoList_Date.insert(moveDate, at:destinationIndexPath.row)
        let moveContent = todoList_Content[sourceIndexPath.row]
        todoList_Content.remove(at: sourceIndexPath.row)
        todoList_Content.insert(moveContent, at:destinationIndexPath.row)
        saveData.set(todoList_Date, forKey: "todo_Date")
        saveData.set(todoList_Content, forKey: "todo_Content")
        
    }
    
    //func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        //return .none
    //}

    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    

    @IBOutlet var table: UITableView!
    
    var saveData: UserDefaults = UserDefaults.standard
    var todoList_Date = [String]()
    var todoList_Content = [String]()
    var todoDate: String!
    var todoContent: String!
    var edit: Bool = true
    var update: Bool = false
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource = self
        
        table.delegate = self
        
        todoList_Date = saveData.array(forKey: "todo_Date") as? [String] ?? []
        todoList_Content = saveData.array(forKey: "todo_Content") as? [String] ?? []
        
        //並び替え
        table.isEditing = true
        table.allowsSelectionDuringEditing = true
        
    }
    
    
    
    @IBAction func myUnwindAction(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        if unwindSegue.identifier == "backToFirst" {
            todoList_Date = saveData.array(forKey: "todo_Date") as? [String] ?? []
            todoList_Content = saveData.array(forKey: "todo_Content") as? [String] ?? []
            if update == true{
                todoList_Date[index] = todoDate
                todoList_Content[index] = todoContent
            }else{
                todoList_Date.append(todoDate)
                todoList_Content.append(todoContent ?? "")
            }
            saveData.set(todoList_Date, forKey: "todo_Date")
            saveData.set(todoList_Content, forKey: "todo_Content")
            table.reloadData()
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit" {
            if let indexPath = table.indexPathForSelectedRow {
                let addTodoViewController = segue.destination as! AddTodoViewController
                addTodoViewController.dateString = self.todoList_Date[indexPath.row]
                addTodoViewController.contentString = self.todoList_Content[indexPath.row]
                addTodoViewController.edit = self.edit
                addTodoViewController.index = indexPath.row
            }
        }
    }



}

