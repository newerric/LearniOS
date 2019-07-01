//
//  ViewController.swift
//  SwitchingViews2
//
//  Created by mikewang on 2019/7/1.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: IBAction
    
    @IBAction func gotoView2(_ sender: UIButton) {
        let lightRed = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lightRed")
        
        // from bottom to top
        //present(lightRed, animated: true, completion: nil)
        
        // from right to left
        self.navigationController?.pushViewController(lightRed, animated: true)
    }
    

}

