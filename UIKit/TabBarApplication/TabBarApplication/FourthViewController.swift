//
//  FourthViewController.swift
//  TabBarApplication
//
//  Created by mikewang on 2019/6/20.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
