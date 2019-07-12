//
//  ViewController.swift
//  TextFieldIcon
//
//  Created by mikewang on 2019/7/12.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let mailImage = UIImage(named: "Mail") else { return }
        guard let passwordImage = UIImage(named: "Password") else { return }
        addIcon(to: emailTF, withImage: mailImage)
        addIcon(to: passwordTF, withImage: passwordImage)
        
    }
    
    // MARK: - Other Method
    
    func addIcon(to tf: UITextField, withImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: img.size.width + 10, height: img.size.height))
        leftImageView.contentMode = .scaleAspectFit
        leftImageView.image = img
        tf.leftView = leftImageView
        tf.leftViewMode = .always
        
    }
    
    
}

