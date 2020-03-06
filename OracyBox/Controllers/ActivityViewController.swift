//
//  ActivityViewController.swift
//  OracyBox
//
//  Created by Adam Howells on 02/03/2020.
//  Copyright © 2020 Adam Howells. All rights reserved.
//

import UIKit
import KeychainSwift

class ActivityViewController: UIViewController {
    
    let keychain1 = KeychainSwift(keyPrefix: Keys.prefix1)
    let keychain2 = KeychainSwift(keyPrefix: Keys.prefix2)
    
    var areaName = ""
    var categoryName = ""
    var activityName = ""

    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var token1Text: UITextView!
    @IBOutlet weak var token2Text: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        areaLabel.text = areaName
        categoryLabel.text = categoryName
        activityLabel.text = activityName
        nameLabel.text = keychain1.get(Keys.name)
        token1Text.text = keychain1.get(Keys.token)!
        token2Text.text = keychain2.get(Keys.token)!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
