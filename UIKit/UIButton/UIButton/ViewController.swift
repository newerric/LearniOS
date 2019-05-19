//
//  ViewController.swift
//  UIButton
//
//  Created by mikewang on 2019/5/19.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // how to make system style button via code
        let newButton = UIButton(type: UIButton.ButtonType.system)
        newButton.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        newButton.setTitle("Press", for: UIControl.State.normal)
        newButton.setTitle("Pressing", for: UIControl.State.highlighted)
        view.addSubview(newButton)
        newButton.addTarget(self, action: #selector(ViewController.hitMe(_:)), for: UIControl.Event.touchUpInside)
        
        // how to make image button via code
        let anotherButton = UIButton(type: UIButton.ButtonType.custom)
        anotherButton.frame = CGRect(x: 200, y: 200, width: 114, height: 54)
        anotherButton.setImage(UIImage(named: "PlayButton"), for: UIControl.State.normal)
        anotherButton.setImage(UIImage(named: "PlayButtonPressed"), for: UIControl.State.highlighted)
        view.addSubview(anotherButton)
        anotherButton.addTarget(self, action: #selector(hitMe(_:)), for: UIControl.Event.touchUpInside)
        
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        print("Hello World")
    }
    
    @objc func hitMe(_ thisButton:UIButton){
        print("Yo! What's up?")
    }
    
}

