//
//  ViewController.swift
//  UISwitch
//
//  Created by mikewang on 2019/5/14.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBAction func makeAChange(_ sender: UISwitch) {
        // Use isOn to check the status of the switch
        if sender.isOn == true{
            print("It's on")
            view.backgroundColor = .white
        }else{
            print("It's off")
            view.backgroundColor = UIColor.black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mySwitch.isOn = false
        makeAChange(mySwitch)
        
        let codeSwitch = UISwitch(frame: CGRect(x: view.frame.midX - 51/2, y: view.frame.maxY - 100, width: 51, height: 31))
        codeSwitch.isOn = true
        codeSwitch.addTarget(self, action: #selector(ViewController.codeSwitchChanged(_:)), for: .valueChanged)
        
        view.addSubview(codeSwitch)
    }
    
    @objc func codeSwitchChanged(_ sender:UISwitch){
        // Use isOn to check the status of the switch
        if sender.isOn == true{
            print("It's on")
            view.backgroundColor = .white
        }else{
            print("It's off")
            view.backgroundColor = UIColor.black
        }
    }


}

