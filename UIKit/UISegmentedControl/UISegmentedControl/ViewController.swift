//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by mikewang on 2019/5/14.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func myToggleChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            view.backgroundColor = UIColor.white
        } else if sender.selectedSegmentIndex == 1 {
            view.backgroundColor = UIColor.black
        } else if sender.selectedSegmentIndex == 2 {
            view.backgroundColor = UIColor.red
        } else if sender.selectedSegmentIndex == 3 {
            view.backgroundColor = UIColor.orange
        } else if sender.selectedSegmentIndex == 4 {
            view.backgroundColor = UIColor.yellow
        } else {
            view.backgroundColor = UIColor.black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

