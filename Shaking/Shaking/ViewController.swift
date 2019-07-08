//
//  ViewController.swift
//  Shaking
//
//  Created by mikewang on 2019/7/9.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit
import UIView_Shake

class ViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction
    
    @IBAction func Shake(_ sender: UIButton) {
        // Shake with the default speed
        self.view.shake(10,              // 10 times
            withDelta: 5.0   // 5 points wide
        )
    }
    
    
    
    


}

