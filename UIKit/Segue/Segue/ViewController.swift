//
//  ViewController.swift
//  Segue
//
//  Created by mikewang on 2019/7/1.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LightRedViewControllerDelegate {
    
    func setColor(colorType: String) {
        if colorType == "red" {
            view.backgroundColor = .red
        }else if colorType == "green" {
            view.backgroundColor = .green
        }else if colorType == "blue" {
            view.backgroundColor = .blue
        }
    }
    

    @IBOutlet weak var myTextInput: UITextField!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - IBAction
    
    @IBAction func changeView(_ sender: UIButton) {
        if let inputText = myTextInput.text {
            if inputText == "" {
                // no input, pop up an alert
                let myAlert = UIAlertController(title: "No input", message: "Please enter something", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                myAlert.addAction(okAction)
                present(myAlert, animated: true, completion: nil)
                
            } else {
                // change view
                performSegue(withIdentifier: "gotoview2", sender: inputText)
                // clear text
                myTextInput.text = ""
                myTextInput.resignFirstResponder()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoview2" {
            if let lightRed = segue.destination as? LightRedViewController {
                lightRed.infoFromViewOne = sender as? String
                lightRed.delegate = self
            }
        }
    }
}

