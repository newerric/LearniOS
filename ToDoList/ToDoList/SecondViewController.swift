//
//  SecondViewController.swift
//  ToDoList
//
//  Created by mikewang on 2019/7/3.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    var editRowIndex: Int?
    @IBOutlet weak var myTextInput: UITextField!
    @IBOutlet weak var myButton: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextInput.becomeFirstResponder()
        myTextInput.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if editRowIndex != nil {
            if let firstViewController = tabBarController?.viewControllers?[0] as? FirstViewController {
                myTextInput.text =  firstViewController.toDos[editRowIndex!]
                setButtonText("Save")
            }
        }
    }

    // MARK: - IBAction
    
    @IBAction func buttonPressed(_ sender: UIButton) {
//        if let text = myTextInput.text {
//            if text != "" {
//                if let firstViewController = tabBarController?.viewControllers?[0] as? FirstViewController {
//                    firstViewController.toDos.append(text)
//                    firstViewController.myTableView.reloadData()
//                    UserDefaults.standard.set(firstViewController.toDos, forKey: "todos")
//                }
//            }
//        }
        
        // refactor
        if let text = myTextInput.text {
            guard let firstViewController = tabBarController?.viewControllers?[0] as? FirstViewController else { return }
            
            if text != "" {
                if editRowIndex != nil {
                    firstViewController.toDos[editRowIndex!] = text
                    editRowIndex = nil
                } else {
                    firstViewController.toDos.append(text)
                }
                ReloadAndSaveTodosToUserDefaults(firstViewController)
            } else {
                if editRowIndex != nil {
                    firstViewController.toDos.remove(at: editRowIndex!)
                    ReloadAndSaveTodosToUserDefaults(firstViewController)
                    editRowIndex = nil
                }
            }
        }
        
        myTextInput.text = ""
        setButtonText("Save")
        tabBarController?.selectedIndex = 0
        
    }
    
    @IBAction func textFieldDidChanged(_ sender: UITextField) {
        if sender.text != "" {
            setButtonText("Save")
        } else {
            setButtonText("Back")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        buttonPressed(UIButton())
        return true
    }
    
    // MARK: - Other Method
    
    private func setButtonText(_ text: String) {
        myButton.setTitle(text, for: .normal)
    }
    
    private func ReloadAndSaveTodosToUserDefaults(_ firstViewController: FirstViewController) {
        firstViewController.myTableView.reloadData()
        UserDefaults.standard.set(firstViewController.toDos, forKey: "todos")
    }
    
}
