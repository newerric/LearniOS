//
//  FirstViewController.swift
//  ThreeDTouch
//
//  Created by mikewang on 2019/7/8.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIViewControllerPreviewingDelegate {

    @IBOutlet weak var firstViewLabel: UILabel!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myItem = UIApplicationShortcutItem(type: "gotothird", localizedTitle: "Third", localizedSubtitle: "go to third view", icon: UIApplicationShortcutIcon(type: .search), userInfo: nil)
        UIApplication.shared.shortcutItems = [myItem]
        
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: firstViewLabel)
        }
    }
    
    // MARK: - Previewing Controller
    
    // PEAK
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        return storyboard?.instantiateViewController(withIdentifier: "peak")
    }
    
    // POP
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        if let popVC = storyboard?.instantiateViewController(withIdentifier: "pop") as? PopViewController {
            popVC.infoFromViewOne = firstViewLabel.text
            present(popVC, animated: true, completion: nil)
        }
        
    }


}

