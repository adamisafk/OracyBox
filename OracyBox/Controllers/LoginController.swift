//
//  ViewController.swift
//  OracyBox
//
//  Created by Adam Howells on 27/02/2020.
//  Copyright © 2020 Adam Howells. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

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
    
    func createAlert(title:String, message:String) {
        let titleID = title
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField(configurationHandler: usernameTextField)
        alert.addTextField(configurationHandler: passwordTextField)
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { (login) in
            alert.dismiss(animated: true, completion: nil)
            self.loginUser()
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
    
    func loginUser() {
        print("User Logged In")
        // login user
    }

}

