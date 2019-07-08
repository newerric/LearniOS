//
//  SecondViewController.swift
//  ThreeDTouch
//
//  Created by mikewang on 2019/7/8.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerPreviewingDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    
    let appleProducts = ["iPhone","iPad", "Apple Watch"]
    var selectedProduct: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: myTableView)
        }
    }
    
    // MARK: - Controller Previewing
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if let selectedRow = myTableView.indexPathForRow(at: location)?.row {
            selectedProduct = appleProducts[selectedRow]
            return storyboard?.instantiateViewController(withIdentifier: "peak")
        } else {
            return nil
        }
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        guard selectedProduct != nil else { return }
        if let popVC = storyboard?.instantiateViewController(withIdentifier: "pop") as? PopViewController {
            popVC.infoFromViewOne = selectedProduct
            selectedProduct = nil
            present(popVC, animated: true, completion: nil)
        }
    }
    
    // MARK: - TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appleProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = appleProducts[indexPath.row]
        
        return cell
    }
    


}

