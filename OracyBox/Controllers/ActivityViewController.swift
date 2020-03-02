//
//  ActivityViewController.swift
//  OracyBox
//
//  Created by Adam Howells on 02/03/2020.
//  Copyright © 2020 Adam Howells. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
    
    var areaName = ""
    var categoryName = ""
    var activityName = ""

    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        areaLabel.text = areaName
        categoryLabel.text = categoryName
        activityLabel.text = activityName
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
