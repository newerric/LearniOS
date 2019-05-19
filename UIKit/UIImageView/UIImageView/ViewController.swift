//
//  ViewController.swift
//  UIImageView
//
//  Created by mikewang on 2019/5/18.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myPet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPet.image = UIImage(named: "MyCat")
    }


}

