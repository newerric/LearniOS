//
//  DetailViewController.swift
//  TableView
//
//  Created by mikewang on 2019/7/2.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var infoFromViewOne: String?
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = infoFromViewOne
        if let imageName = infoFromViewOne {
            myImageView.image = UIImage(named: imageName)
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
