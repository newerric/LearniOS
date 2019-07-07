//
//  ViewController.swift
//  RSSReader
//
//  Created by mikewang on 2019/7/7.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var objects = [NewsItem]()
    var xmlAddress = "https://www.cnet.com/rss/news/"
    var session = URLSession(configuration: .default)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        //getFakeNews()
        downloadXML(withXMLAddress: xmlAddress)
    }
    
    // MARK: - TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = objects[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showinfo" {
            if let dvc = segue.destination as? WebViewController {
                if let selectedRow = myTableView.indexPathForSelectedRow?.row {
                  dvc.linkFromViewOne =  objects[selectedRow].link
                }
            }
        }
    }
    
    // MARK: - Other Method
    
    private func downloadXML(withXMLAddress xmlAddress: String) {
        if let url = URL(string: xmlAddress) {
            let task = session.dataTask(with: url, completionHandler: {
                (data, response, error) in
                if error != nil {
                    DispatchQueue.main.async {
                        self.popAlert(withTitle: error!.localizedDescription)
                    }
                    return
                }
                if let okData = data {
                    let parser = XMLParser(data: okData)
                    let rssParserDelegate = RSSParserDelegate()
                    parser.delegate = rssParserDelegate
                    if parser.parse() == true {
                        self.objects = rssParserDelegate.getResult()
                        DispatchQueue.main.async {
                            self.myTableView.reloadData()
                        }
                    } else {
                        print("parser failed.")
                    }
                }
            })
            task.resume()
        }
    }
    
    private func popAlert(withTitle title: String) {
        let alert = UIAlertController(title: title, message: "Please try again later", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func getFakeNews() {
        let news1 = NewsItem(title: "first news", link: "https://www.apple.com")
        let news2 = NewsItem(title: "second news", link: "https://www.nike.com")
        let news3 = NewsItem(title: "third news", link: "https://www.udemy.com")
        objects = [news1, news2, news3]
    }
}

