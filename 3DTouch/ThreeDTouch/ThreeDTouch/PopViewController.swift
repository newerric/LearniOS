//
//  PopViewController.swift
//  ThreeDTouch
//
//  Created by mikewang on 2019/7/8.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class PopViewController: UIViewController {

    @IBOutlet weak var popLabel: UILabel!
    
    var infoFromViewOne: String?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        popLabel.text = infoFromViewOne
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if traitCollection.forceTouchCapability == .available {
                popLabel.text = "\(touch.force)"
            }
        }
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
