//
//  FirstViewController.swift
//  TabBarApplication
//
//  Created by mikewang on 2019/6/20.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = "Hello World"
    }


}

