//
//  NewViewController.swift
//  HelloTabBar
//
//  Created by mikewang on 2019/7/1.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    var messageFromViewOne: String?
    
    @IBOutlet weak var myTextInput: UITextField!
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextInput.text = messageFromViewOne
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTextInput.becomeFirstResponder()
    }
    
    // MARK: - IBAction
    
    @IBAction func OK(_ sender: UIButton) {
        if let inputText = myTextInput.text {
            print(inputText)
            myTextInput.text = ""
            myTextInput.resignFirstResponder()
            if let firstViewController = self.tabBarController?.viewControllers?[0] as? ViewController {
                firstViewController.myLabel.text = inputText
                self.tabBarController?.selectedIndex = 0
            }
        }
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
