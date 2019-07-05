//
//  ViewController.swift
//  DownloadImage
//
//  Created by mikewang on 2019/7/5.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    var session: URLSession?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageAddress = "https://cdn.shopify.com/s/files/1/2432/5051/files/chiron.jpg?v=1524099176"
        session = URLSession(configuration: .default)
        
        if let imageUrl = URL(string: imageAddress) {
            /*
            DispatchQueue.global().async {
                do {
                    let downloadImage = UIImage(data: try Data(contentsOf: imageUrl))
                    DispatchQueue.main.async {
                        self.myImageView.image = downloadImage
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            */
            
            /*
            let task = session?.dataTask(with: imageUrl, completionHandler: {
                (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                if let loadedData = data {
                    let loadedImage = UIImage(data: loadedData)
                    DispatchQueue.main.async {
                        self.myImageView.image = loadedImage
                    }
                }
            })
            task?.resume()
            */
            
            let newTask = session?.downloadTask(with: imageUrl, completionHandler: {
                (url, response, error) in
                if error != nil {
                    let errorCode = (error! as NSError).code
                    if errorCode == -1009 {
                        print("no internet connection")
                    } else {
                        print(error!.localizedDescription)
                    }
                    return
                }
                if let loadedURL = url {
                    do {
                        let loadedImage = UIImage(data: try Data(contentsOf: loadedURL))
                        DispatchQueue.main.async {
                            self.myImageView.image = loadedImage
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            })
            newTask?.resume()
            
            
        }
        
    }


}

