//
//  ViewController.swift
//  HelloUIView
//
//  Created by mikewang on 2019/5/13.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var midRect: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set background color
        midRect.backgroundColor = UIColor.green
        // set transparency 0~1
        midRect.alpha = 0.5
        // hide uiview, make it invisible
        //midRect.isHidden = true
        
        self.view.backgroundColor = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
        // optional chaining
        //self.view.viewWithTag(101)?.backgroundColor = UIColor.lightGray
        
        let viewArea = CGRect(x: 50, y: 400, width: 100, height: 50)
        let smallRect = UIView(frame: viewArea)
        smallRect.backgroundColor = UIColor.purple
        view.addSubview(smallRect)
        
        
    }


}

