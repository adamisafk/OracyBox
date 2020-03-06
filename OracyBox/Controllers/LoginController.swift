//
//  ViewController.swift
//  OracyBox
//
//  Created by Adam Howells on 27/02/2020.
//  Copyright © 2020 Adam Howells. All rights reserved.
//

import UIKit
import Alamofire
import KeychainSwift
import SwiftyJSON
import Alamofire_SwiftyJSON

// Keys
struct Keys {
    static let prefix1 = "user1_"
    static let prefix2 = "user2_"
    static let token = "token"
    
    static let id = "id"
    static let role_id = "role_id"
    static let name = "name"
    static let email = "email"
    static let avatar = "avatar"
}

class LoginController: UIViewController {
    
    // need to load the website first, then use ps:exec to reinstall passport oauth private keys between thirty minutes of inactivity due to heroku free plan.
    let baseURL =  "http://oracybox.test/api/user/login"
    private let networkingClient = NetworkingClient()
    let keychain1 = KeychainSwift(keyPrefix: Keys.prefix1)
    let keychain2 = KeychainSwift(keyPrefix: Keys.prefix2)
    let userController = UserController()

    override func viewDidLoad() {
        super.viewDidLoad()
        letsgoButton.isHidden = true
        letsgoLabel.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var letsgoButton: UIButton!
    @IBOutlet weak var letsgoLabel: UILabel!
    
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBAction func loginButtonClick(_ sender: UIButton) {
        createAlert(title: "Login #1", message: "Please ask your teacher if you don't remember your username and password!")
    }
    
    // Login alert box
    func createAlert(title:String, message:String) {
        let titleID = title
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField(configurationHandler: usernameTextField)
        alert.addTextField(configurationHandler: passwordTextField)
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { (login) in
            let usernameField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            self.loginUser(username: usernameField.text!, password: passwordField.text!, loginTitle: titleID)
            alert.dismiss(animated: true, completion: nil)
            if titleID == "Login #1" {
                self.createAlert(title: "Login #2", message: "Please ask your teacher if you don't remember your username and password!")
            } else {
                self.loginButton.isHidden = true
                self.loginLabel.isHidden = true
                self.letsgoButton.isHidden = false
                self.letsgoLabel.isHidden = false
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (cancel) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    func usernameTextField(textField: UITextField) {
        textField.placeholder = "Enter your username"
    }
    func passwordTextField(textField: UITextField) {
        textField.placeholder = "Enter your password"
        textField.isSecureTextEntry = true
    }
    // Error alert box
    func createErrorAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Login Error", style: .default, handler: { (loginerror) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    

    
    func loginUser(username: String, password: String, loginTitle: String) {
        let loginURL = self.baseURL + "?email=" + username + "&password=" + password
        
        Alamofire.request(loginURL, method: .post).responseSwiftyJSON { response in
            // TODO: Error handling and response status handling
            // TODO: Use parameters to pass through username and password (security)
            //debugPrint(response)
            let json = try! JSON(data: response.data!)
            //print(json["success"]["token"].stringValue)
            
            if loginTitle == "Login #1" {
                if self.keychain1.set(json["success"]["token"].stringValue, forKey: Keys.token) {
                    print("set user 1 token")
                    self.userController.getUser(token: self.keychain1.get(Keys.token)!, prefix: Keys.prefix1)
                } else {
                    print("did not set")
                }
            } else {
                if self.keychain2.set(json["success"]["token"].stringValue, forKey: Keys.token) {
                    print("set user 2 token")
                } else {
                    print("did not set")
                }
            }
        }
        
//        guard let urlToExecute = URL(string: loginURL) else {
//            return
//        }
//
//        networkingClient.execute(urlToExecute) { (json, error) in
//            if let error = error {
//                self.createErrorAlert(title: "Failed to Login", message: error.localizedDescription)
//            } else if let json = json {
//                print(json.description)
//            }
//        }
    }

}

