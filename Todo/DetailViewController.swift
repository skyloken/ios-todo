//
//  DetailViewController.swift
//  Todo
//
//  Created by ken on 2018/10/01.
//  Copyright © 2018 skyloken. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    @IBOutlet weak var todoTitle: UITextField!
    @IBOutlet weak var todoMemo: UITextField!
    
    var id: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let todoId = id else {
            return
        }
        
        let realm = try! Realm()
        let todo = realm.object(ofType: Todo.self, forPrimaryKey: todoId)
        
        todoTitle.text = todo?.text
        todoMemo.text = todo?.memo

    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // Todoを保存
    @IBAction func saveTodo(_ sender: Any) {
        
        guard let todoId = id else {
            return
        }
        
        let realm = try! Realm()
        let todo = realm.object(ofType: Todo.self, forPrimaryKey: todoId)
        try! realm.write {
            todo?.text = todoTitle.text!
            todo?.memo = todoMemo.text!
        }
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
