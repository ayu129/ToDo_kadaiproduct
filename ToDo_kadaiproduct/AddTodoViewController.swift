//
//  AddTodoViewController.swift
//  ToDo_kadaiproduct
//
//  Created by 伊藤愛結 on 2021/02/15.
//

import UIKit

class AddTodoViewController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var todoTextField: UITextField!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var formatter = DateFormatter()
    var dateString: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //UIDatePickerの値が変わった時に呼び出されるメソッド
    //@IBAction func changeDate(_ sender: UIDatePicker) {
       //formatter.dateFormat = "yyyy/MM/dd"
    //}
    
    
//    @IBAction func save(){
//        formatter.dateFormat = "yyyy/MM/dd"
//        dateString = formatter.string(from: datePicker.date)
//        todoList_date.append(dateString)
//        saveData.set(todoList_date, forKey: "todo_Date")
//        todoList_content.append(todoTextField.text ?? "")
//        saveData.set(todoList_content, forKey: "todo_Content")
//        print("number3")
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToFirst" {
            formatter.dateFormat = "yyyy/MM/dd"
            dateString = formatter.string(from: datePicker.date)
            let firstViewController = segue.destination as! ViewController
            firstViewController.todoDate = self.dateString
            firstViewController.todoContent = self.todoTextField.text
        }
    }
    
    @IBAction func cancel(){
        self.dismiss(animated: true, completion: nil)
    }

}
