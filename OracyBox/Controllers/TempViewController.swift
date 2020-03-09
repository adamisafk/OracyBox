//
//  TempViewController.swift
//  OracyBox
//
//  Created by Adam Howells on 09/03/2020.
//  Copyright © 2020 Adam Howells. All rights reserved.
//

import UIKit
import SwiftyJSON

class TempViewController: UIViewController {
    
    let curriculumController = CurriculumController()
    var activityId = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(activityId)
    }
    
    
    @IBOutlet weak var resultsTextField: UITextField!
    @IBOutlet weak var mediaPathTextField: UITextField!
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: "Submitted", message: "You have submitted a completed activity!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (dismiss) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func submitOnClick(_ sender: UIButton) {
        // parse string from text field to json object
        struct Results: Codable {
            var score: String
        }
        let results = Results(score: resultsTextField.text!)
        let encoder = JSONEncoder()
        let data = try! encoder.encode(results)
        let json = try! JSON(data: data)
        
        curriculumController.postCompletedActivity(activityId: activityId, results: json, media_path: mediaPathTextField.text!) { (json) in
            print(json)
            self.createAlert(title: "Submitted", message: "You have submitted a completed activity!")
        }
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
