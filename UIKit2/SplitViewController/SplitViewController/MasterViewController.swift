//
//  MasterViewController.swift
//  SplitViewController
//
//  Created by mikewang on 2019/7/7.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var appleProduct = ["iPhone","iPad","iPod","Apple TV","Apple Watch", "Air Pod","HomePod"]
    


    override func viewDidLoad() {
        super.viewDidLoad()
        //splitViewController?.preferredDisplayMode = .allVisible
        
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc
    func insertNewObject(_ sender: Any) {
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let dvc = segue.destination as? UINavigationController
            let detailViewController = dvc?.topViewController as? DetailViewController
            if let selectedRow = tableView.indexPathForSelectedRow?.row {
                detailViewController?.infoFromMasterView = appleProduct[selectedRow]
            }
            
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appleProduct.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = appleProduct[indexPath.row]
        cell.textLabel!.text = object.description
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }


}

