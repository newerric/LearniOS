//
//  ViewController.swift
//  WKWebView
//
//  Created by mikewang on 2019/7/4.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://www.apple.com") {
            let request = URLRequest(url: url)
            myWebView.load(request)
        }
    }


}

