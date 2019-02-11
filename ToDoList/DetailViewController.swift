//
//  DetailViewController.swift
//  ToDoList
//
//  Created by Blake Mazzaferro on 2/10/19.
//  Copyright © 2019 Blake Mazzaferro. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var toDoNotesView: UITextView!
    var toDoItem: String?
    var toDoNotesItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
        }
        if let toDoNotesItem = toDoNotesItem {
            toDoNotesView.text = toDoNotesItem
        }
        enableDisableSaveButton()
        toDoField.becomeFirstResponder()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave"{
            toDoItem = toDoField.text
            toDoNotesItem = toDoNotesView.text
        }
    }
    
    func enableDisableSaveButton() {
        if let toDoLength = toDoField.text?.count, toDoLength > 0 {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }

    @IBAction func toDoFieldChanged(_ sender: UITextField) {
        enableDisableSaveButton()
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
