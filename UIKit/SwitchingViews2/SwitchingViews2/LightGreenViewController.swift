//
//  LightGreenViewController.swift
//  SwitchingViews2
//
//  Created by mikewang on 2019/7/1.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class LightGreenViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: IBAction
    
    @IBAction func backToView2(_ sender: UIButton) {
        // back to root
        //navigationController?.popToRootViewController(animated: true)
        
        //navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
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
