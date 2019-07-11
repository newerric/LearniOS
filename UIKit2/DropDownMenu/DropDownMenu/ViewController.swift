//
//  ViewController.swift
//  DropDownMenu
//
//  Created by mikewang on 2019/7/11.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var options: [UIButton]!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction

    @IBAction func startSelect(_ sender: UIButton) {
        for option in options {
            UIView.animate(withDuration: 0.3) {
                option.isHidden = !option.isHidden
                self.view.layoutIfNeeded()
            }
            
        }
    }
    
    @IBAction func optionPressed(_ sender: UIButton) {
        let gameName = sender.currentTitle ?? ""
        print(gameName)
    }
    
}

