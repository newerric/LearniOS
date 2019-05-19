//
//  ViewController.swift
//  UIButton
//
//  Created by mikewang on 2019/5/19.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // clouse {}() ＝> 代表立即執行
    let codeButton:UIButton = {
        let newButton = UIButton(type: UIButton.ButtonType.system)
        newButton.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        newButton.setTitle("Press", for: UIControl.State.normal)
        newButton.setTitle("Pressing", for: UIControl.State.highlighted)
        newButton.addTarget(self, action: #selector(ViewController.hitMe(_:)), for: UIControl.Event.touchUpInside)
        return newButton
    }()
    let anotherButton:UIButton = {
        let anotherButton = UIButton(type: UIButton.ButtonType.custom)
        anotherButton.frame = CGRect(x: 200, y: 200, width: 114, height: 54)
        anotherButton.setImage(UIImage(named: "PlayButton"), for: UIControl.State.normal)
        anotherButton.setImage(UIImage(named: "PlayButtonPressed"), for: UIControl.State.highlighted)
        anotherButton.addTarget(self, action: #selector(hitMe(_:)), for: UIControl.Event.touchUpInside)
        return anotherButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        print("Hello World")
    }
    
    func setupUI(){
        view.addSubview(codeButton)
        view.addSubview(anotherButton)
    }
    
    @objc func hitMe(_ thisButton:UIButton){
        print("Yo! What's up?")
    }
    
}

