//
//  ViewController.swift
//  Xylophone
//
//  Created by appsgaga on 2017/10/24.
//  Copyright © 2017年 appsgaga. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var soundHelper = SoundHelper()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBAction
    
    @IBAction func playSound(_ sender: UIButton) {
        soundHelper.playSound(tag: sender.tag)
    }
    
}
