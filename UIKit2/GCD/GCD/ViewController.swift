//
//  ViewController.swift
//  GCD
//
//  Created by mikewang on 2019/7/5.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let task1 = {
            for i in 1...5 {
                print("Task1: \(i)")
            }
        }
        let task2 = {
            for i in 1...5 {
                print("Task2: \(i)")
            }
        }
        
//        DispatchQueue.main.async(execute: task1)
//        DispatchQueue.main.async(execute: task2)
//
        DispatchQueue.global().async(execute: task1)
        DispatchQueue.global().async(execute: task2)
    }


}

