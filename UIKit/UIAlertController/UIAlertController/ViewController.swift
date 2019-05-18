//
//  ViewController.swift
//  UIAlertController
//
//  Created by mikewang on 2019/5/18.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - IBAction
    
    @IBAction func showAlert(_ sender: UIButton) {
        //let myAlert = UIAlertController(title: "Hello", message: "How are you", preferredStyle: UIAlertController.Style.alert)
        let myAlert = UIAlertController(title: "Hello", message: "How are you", preferredStyle: UIAlertController.Style.actionSheet)
//        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
//            (action:UIAlertAction) in
//            self.dismiss(animated: true, completion: nil)
//        }
        // 簡易寫法
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        
        let helloAction = UIAlertAction(title: "Say Hello", style: UIAlertAction.Style.destructive) {
            (action:UIAlertAction) in
            print("hello")
            self.dismiss(animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            (action:UIAlertAction) in
            print("cancel")
            self.dismiss(animated: true, completion: nil)
        }
        
        myAlert.addAction(okAction)
        myAlert.addAction(helloAction)
        myAlert.addAction(cancelAction)
        present(myAlert, animated: true, completion: nil)
    }
    
    


}

