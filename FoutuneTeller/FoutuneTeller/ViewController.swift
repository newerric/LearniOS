//
//  ViewController.swift
//  FoutuneTeller
//
//  Created by mikewang on 2019/5/19.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    @IBOutlet weak var yourFortune: UIImageView!
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction
    
    @IBAction func tellMeSomething(_ sender: UIButton) {
        showAnswer()
    }
    
    // MARK: - Other Method
    
    // 偵測手機搖晃
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake {
            showAnswer()
        }
    }
    
    private func showAnswer() {
        if yourFortune.isHidden == true {
            // show me the answer
            // 1. make a random number 1~6
            let answer = GKRandomSource.sharedRandom().nextInt(upperBound: 6) + 1
            
            // 2. change image
            yourFortune.image =  UIImage(named: "\(answer)")
            
            // 3. sound
            AudioServicesPlaySystemSound(1000)
        }
        
        // 改變為相反狀態
        yourFortune.isHidden = !yourFortune.isHidden
    }


}

