//
//  ViewController.swift
//  UserDefaults
//
//  Created by mikewang on 2019/7/2.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // save info to userDefaults
        //UserDefaults.standard.set("Mike Wang", forKey: "name")
        
        // load info from userDefaults
        if let loadedName = UserDefaults.standard.value(forKey: "name") as? String {
            print(loadedName)
        }
        
        let fruitArray = ["apple", "banana", "mango"]
        UserDefaults.standard.set(fruitArray, forKey: "fruits")
        
//        UserDefaults.standard.array(forKey: "fruits")
//        UserDefaults.standard.stringArray(forKey: "fruits")
        if let loadedFruit = UserDefaults.standard.value(forKey: "fruits") as? [String] {
            dump(loadedFruit)
            for fruit in loadedFruit {
                print(fruit)
            }
        }
    }


}

