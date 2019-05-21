//
//  ViewController.swift
//  ColorFinder
//
//  Created by mikewang on 2019/5/15.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 通常命名就是它是什麼東西，就用它做結尾，像這邊是 Label，所以看到的時候就很直覺
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    var redValue = 255
    var greenValue = 255
    var blueValue = 255
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        redValue = Int(sender.value)
        
        // xxText.text 看起來比較怪，所以用 Label.text 的話，就很直覺
        redLabel.text = "R: \(redValue)"
        
        changeBackgroundColor()
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenValue = Int(sender.value)
        greenLabel.text = "G: \(greenValue)"
        
        changeBackgroundColor()
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        blueValue = Int(sender.value)
        blueLabel.text = "B: \(blueValue)"
        
        changeBackgroundColor()
    }
    
    // MARK: - Other Methods
    
    func changeBackgroundColor() {
        // 逗點前不空格
        // 太長的話可以試著斷行，一眼可以整理到全部資訊
        view.backgroundColor = UIColor(red: CGFloat(redValue) / 255,
                                       green: CGFloat(greenValue) / 255,
                                       blue: CGFloat(blueValue) / 255,
                                       alpha: 1)
    }
    
}

