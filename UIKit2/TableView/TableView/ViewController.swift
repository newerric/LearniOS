//
//  ViewController.swift
//  TableView
//
//  Created by mikewang on 2019/7/1.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let fruitArray = ["apple", "banana", "mango", "watermelon"]
    let colorArray = ["red", "green", "blue"]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getSectionRows(section)
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getCellForRow(tableView, indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        
        if isFruitSection(section) {
            title = "FRUIT"
        } else if isColorSection(section) {
            title = "COLOR"
        }
        
        return title
    }
    
    // MARK: - Other Method
    
    private func isFruitSection(_ section: Int) -> Bool {
        return section == 0
    }
    
    private func isColorSection(_ section: Int) -> Bool {
        return section == 1
    }
    
    private func getSectionRows(_ section: Int) -> Int {
        var rows = 0
        if isFruitSection(section) {
            rows = fruitArray.count
        } else if isColorSection(section) {
            rows = colorArray.count
        }
        return rows
    }
    
    private func getCellForRow(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if isFruitSection(indexPath.section) {
            cell.textLabel?.text = fruitArray[indexPath.row]
        } else if isColorSection(indexPath.section) {
            cell.textLabel?.text = colorArray[indexPath.row]
        }
        
        return cell
    }

}

