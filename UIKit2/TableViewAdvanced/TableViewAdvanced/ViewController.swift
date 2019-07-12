//
//  ViewController.swift
//  TableViewAdvanced
//
//  Created by mikewang on 2019/7/12.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

struct CellData {
    var isOpen: Bool
    var sectionTitle: String
    var sectionData: [String]
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var tableViewData = [CellData]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationUI()
    }
    
    // MARK: TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].isOpen {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].sectionTitle
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            tableViewData[indexPath.section].isOpen = !tableViewData[indexPath.section].isOpen
            let indexes = IndexSet(integer: indexPath.section)
            tableView.reloadSections(indexes, with: .automatic)
        } else {
            // navigation to another view controller's view
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // MARK: Other Method
    
    private func configurationUI() {
        getTableViewData()
        
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    private func getTableViewData() {
        tableViewData = [
            CellData(isOpen: false, sectionTitle: "Animals", sectionData:
                ["Cat","Dog", "Rabbit","Elephant "]),
            CellData(isOpen : false, sectionTitle: "Colors", sectionData: ["Red", "Green ", "Blue "]),
            CellData(isOpen : false, sectionTitle: "Fruits", sectionData: ["Apple", "Banana ", "Mango","Watermelon" ,"Kiwi"]),
            CellData(isOpen : false, sectionTitle: "Numbers", sectionData: ["1","2","3","4","5","6","7"])
        ]
    }
    
}

