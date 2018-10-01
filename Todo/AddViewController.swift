//
//  AddViewController.swift
//  Todo
//
//  Created by ken on 2018/10/01.
//  Copyright © 2018 skyloken. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {

    @IBOutlet weak var newTodoTextField: UITextField!

    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    // Todoを追加
    @IBAction func AddTodoButton(_ sender: Any) {

        // nilならreturn
        guard let text = newTodoTextField.text else {
            return
        }

        // create new todo
        let newTodo = Todo()
        newTodo.text = text

        // insert to realm
        let realm = try! Realm()
        try! realm.write {
            realm.add(newTodo)
        }

        // Todo Listに戻る
        self.navigationController?.popToRootViewController(animated: true)

    }

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

}
