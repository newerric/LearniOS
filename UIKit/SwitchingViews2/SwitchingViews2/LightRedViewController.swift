//
//  LightRedViewController.swift
//  SwitchingViews2
//
//  Created by mikewang on 2019/7/1.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class LightRedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gotoView3(_ sender: UIButton) {
        let lightGreen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lightGreen")
        present(lightGreen, animated: true, completion: nil)
        
        //navigationController?.pushViewController(lightGreen, animated: true)
        
    }
    
    @IBAction func gotoView1(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
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
