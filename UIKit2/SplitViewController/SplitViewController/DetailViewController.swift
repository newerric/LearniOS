//
//  DetailViewController.swift
//  SplitViewController
//
//  Created by mikewang on 2019/7/7.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    var infoFromMasterView: String?
    

    func configureView() {
        title = infoFromMasterView
        detailDescriptionLabel.text = infoFromMasterView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
}

