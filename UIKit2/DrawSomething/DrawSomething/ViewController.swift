//
//  ViewController.swift
//  DrawSomething
//
//  Created by mikewang on 2019/7/9.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvas: Canvas!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.clipsToBounds = true
        canvas.isMultipleTouchEnabled = false
        
    }

    @IBAction func clear(_ sender: UIButton) {
        canvas.clearCanvas()
    }
    
}

