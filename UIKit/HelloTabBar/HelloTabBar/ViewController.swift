//
//  ViewController.swift
//  HelloTabBar
//
//  Created by mikewang on 2019/7/1.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = "First View"
        if let secondViewContrller = self.tabBarController?.viewControllers?[1] as? NewViewController {
            secondViewContrller.messageFromViewOne = "Hi"
        }
    }


}

