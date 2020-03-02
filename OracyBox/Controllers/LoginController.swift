//
//  ViewController.swift
//  OracyBox
//
//  Created by Adam Howells on 27/02/2020.
//  Copyright © 2020 Adam Howells. All rights reserved.
//

import UIKit
import Alamofire

class LoginController: UIViewController {
    
    let baseURL =  "http://oracybox.test/api/user/login"
    private let networkingClient = NetworkingClient()

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
            self.loginUser(username: usernameField.text!, password: passwordField.text!)
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
    

    
    func loginUser(username: String, password: String) {
        print(username, password)
        let loginURL = self.baseURL + "?email=" + username + "&password=" + password
        
        Alamofire.request(loginURL, method: .post).responseJSON { response in
            debugPrint(response)
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

