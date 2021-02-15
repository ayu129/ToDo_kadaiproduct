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
    
    var todoList = [String]()
    var saveData: UserDefaults = UserDefaults.standard
    
    var formatter = DateFormatter()

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
    @IBAction func changeDate(_ sender: UIDatePicker) {
       formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
    }
    
    
    @IBAction func save(){
        
    }
    
    @IBAction func cancel(){
        self.dismiss(animated: true, completion: nil)
    }

}
