//
//  ViewController.swift
//  ColorFinder
//
//  Created by mikewang on 2019/5/15.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redText: UILabel!
    @IBOutlet weak var greenText: UILabel!
    @IBOutlet weak var blueText: UILabel!
    
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
        redText.text = "R: \(redValue)"
        
        changeBackgroundColor()
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenValue = Int(sender.value)
        greenText.text = "G: \(greenValue)"
        
        changeBackgroundColor()
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        blueValue = Int(sender.value)
        blueText.text = "B: \(blueValue)"
        
        changeBackgroundColor()
    }
    
    // MARK: - Other Methods
    
    func changeBackgroundColor() {
        view.backgroundColor = UIColor(red: CGFloat(redValue) / 255 , green: CGFloat(greenValue) / 255 , blue: CGFloat(blueValue) / 255 , alpha: 1)
    }
    
}

