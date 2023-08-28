//
//  EntryViewController.swift
//  Todobox
//
//  Created by 이예빈 on 2023/08/28.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var field: UITextField!
    
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        
        return true
    }

    @IBAction func saveTask(){
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        guard var count = UserDefaults().value(forKey: "count") as? Int else { return };
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
        update?()
        
        navigationController?.popViewController(animated: true)
    }
    
}
