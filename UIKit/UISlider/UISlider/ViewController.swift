//
//  ViewController.swift
//  UISlider
//
//  Created by mikewang on 2019/5/15.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        myLabel.text = "\(Int(sender.value))"
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

