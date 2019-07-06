//
//  ViewController.swift
//  RandomUser
//
//  Created by mikewang on 2019/7/5.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit
import AudioToolbox

struct User {
    var name: String?
    var email: String?
    var number: String?
    var image: String?
}

// API Model
struct AllData: Decodable {
    var results: [SingleData]?
}

struct SingleData: Decodable {
    var name: Name?
    var email: String?
    var phone: String?
    var picture: Picture?
}

struct Name: Decodable {
    var first: String?
    var last: String?
}

struct Picture: Decodable {
    var large: String?
}


class ViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    var infoTableViewController: InfoTableViewController?
    let apiAddress = "https://randomuser.me/api/"
    var urlSession = URLSession(configuration: .default)
    var isDownloading = false
    
    // MARK: - Life Cycle
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeNavigationbarColor()
        //settingInfo(user: GetFakeUser())
        
        downloadInfo(withAddress: apiAddress)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUserImageCircle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moreinfo" {
            infoTableViewController = segue.destination as? InfoTableViewController
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func makeNewUser(_ sender: UIBarButtonItem) {
        if isDownloading == false {
            downloadInfo(withAddress: apiAddress)
        }
    }
    
    // MARK: - Other Method
    
    private func GetFakeUser() -> User {
        return User(name: "Mike Wang", email: "mike@mikeceo.com", number: "888-8888", image: "https://www.apple.com")
    }
    
    private func setUserImageCircle() {
        // set user image circle
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
        userImage.clipsToBounds = true
    }
    
    private func changeNavigationbarColor() {
        // change navigation bar color
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.67, green: 0.2, blue: 0.157, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    
    private func settingInfo(user: User) {
        userName.text = user.name
        infoTableViewController?.phoneLabel.text = user.number
        infoTableViewController?.emailLabel.text = user.email
        if let imageAddress = user.image {
            if let imageURL = URL(string: imageAddress) {
                let task = urlSession.downloadTask(with: imageURL) {
                    (url, response, error) in
                    if error != nil {
                        DispatchQueue.main.async {
                            self.popAlert(title: error!.localizedDescription)
                        }
                        self.isDownloading = false
                        return
                    }
                    if let okURL = url {
                        do {
                            let downloadedImage = UIImage(data: try Data(contentsOf: okURL))
                            DispatchQueue.main.async {
                                self.userImage.image = downloadedImage
                                AudioServicesPlaySystemSound(1000)
                            }
                            self.isDownloading = false
                        } catch {
                            DispatchQueue.main.async {
                                self.popAlert(title: "error")
                            }
                            self.isDownloading = false
                        }
                    } else {
                        self.isDownloading = false
                    }
                }
                task.resume()
            } else {
                isDownloading = false
            }
        } else {
            isDownloading = false
        }
    }
    
    private func downloadInfo(withAddress webAddress: String) {
        if let url = URL(string: webAddress) {
            let task = urlSession.dataTask(with: url) {
                (data, response, error) in
                if error != nil {
                    let errorCode = (error! as NSError).code
                    if errorCode == -1009 {
                        DispatchQueue.main.async {
                            self.popAlert(title: "no internet connection")
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.popAlert(title: error?.localizedDescription ?? "error")
                        }
                    }
                    self.isDownloading = false
                    return
                }
                if let loadedData = data {
                    do {
//                        let json = try JSONSerialization.jsonObject(with: loadedData, options: JSONSerialization.ReadingOptions.init())
//                        DispatchQueue.main.async {
//                            self.parseJson(json: json)
//                        }
                        let okData = try JSONDecoder().decode(AllData.self, from: loadedData)
                        let firstName = okData.results?[0].name?.first
                        let lastName = okData.results?[0].name?.last
                        let fullName: String? = {
                            guard let okFirstName = firstName, let okLastName = lastName else { return nil }
                            return okFirstName + " " + okLastName
                        }()
                        let email = okData.results?[0].email
                        let phone = okData.results?[0].phone
                        let picture = okData.results?[0].picture?.large
                        let aUser = User(name: fullName, email: email, number: phone, image: picture)
                        DispatchQueue.main.async {
                            self.settingInfo(user: aUser)
                        }
                    } catch {
                        DispatchQueue.main.async {
                            self.popAlert(title: "parse data error!")
                        }
                        self.isDownloading = false
                    }
                } else {
                    self.isDownloading = false
                }
            }
            task.resume()
            isDownloading = true
        }
    }
    
    private func popAlert(title: String) {
        let alert = UIAlertController(title: title, message: "Please try again later", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func parseJson(json: Any) {
        if let okJson = json as? [String: Any] {
            if let infoArray = okJson["results"] as? [[String: Any]] {
                let infoDictionary = infoArray[0]
                let loadedName = getUserFullName(nameDictionary: infoDictionary["name"])
                let loadedEmail = infoDictionary["email"] as? String
                let loadedPhone = infoDictionary["phone"] as? String
                let imageDictionary = infoDictionary["picture"] as? [String: String]
                let loadedImageAddress = imageDictionary?["large"]
                let loadedUser = User(name: loadedName, email: loadedEmail, number: loadedPhone, image: loadedImageAddress)
                settingInfo(user: loadedUser)
            }
        }
    }
    
    private func getUserFullName(nameDictionary: Any) -> String? {
        if let okDictionary = nameDictionary as? [String: String] {
            let firstName = okDictionary["first"] ?? ""
            let lastName = okDictionary["last"] ?? ""
            return firstName + " " + lastName
        } else {
            return nil
        }
    }


}

