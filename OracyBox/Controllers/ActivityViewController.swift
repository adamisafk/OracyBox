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
    let curriculumController = CurriculumController()
    
    var areaName = ""
    var categoryName = ""
    var activityName = ""
    var activityId = Int()

    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        areaLabel.text = areaName
        categoryLabel.text = categoryName
        activityLabel.text = activityName
        
        let usersName = keychain1.get(Keys.name)
        let usersNameArray = usersName?.split(separator: " ")
        nameLabel.text = usersNameArray![0] + ", you're up first!"
    }
    
    // TEMP
    @IBAction func letsGoOnClick(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TempViewController") as? TempViewController
        vc?.activityId = activityId
        self.navigationController?.pushViewController(vc!, animated: true)
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
