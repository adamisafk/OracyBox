//
//  CategoryTableViewController.swift
//  OracyBox
//
//  Created by Adam Howells on 01/03/2020.
//  Copyright © 2020 Adam Howells. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    var areaName = ""
    var categoryName = ""
    var areaCategories = [] as [String]
    var categoryID = 0
    
    // TEMPORARY ACTIVITY DATA TO PASS TO ACTIVITY TABLE VIEW CONTROLLER
    var activityData = [
        // Expressive Arts [0]
        [
            // [6,1]
            ["1", "2", "3", "4", "5", "6"],
            // [6,2]
            ["1", "2", "3", "4", "5", "6"],
            // [6,3]
            ["1", "2", "3", "4", "5", "6"],
            // [6,4]
            ["1", "2", "3", "4", "5", "6"],
            // [6,5]
            ["1", "2", "3", "4", "5", "6"],
            // [6,6]
            ["1", "2", "3", "4", "5", "6"]
        ],
        // Humanities [1]
        [
            // [3,1]
            ["1", "2", "3", "4", "5", "6"],
            // [3,2]
            ["1", "2", "3", "4", "5", "6"],
            // [3,3]
            ["1", "2", "3", "4", "5", "6"],
            // [3,4]
            ["1", "2", "3", "4", "5", "6"],
            // [3,5]
            ["1", "2", "3", "4", "5", "6"],
            // [3,6]
            ["1", "2", "3", "4", "5", "6"]
        ],
        // Maths and Numeracy [4]
        [
            // [4,1]
            ["1", "2", "3", "4", "5", "6"],
            // [4,2]
            ["1", "2", "3", "4", "5", "6"],
            // [4,3]
            ["1", "2", "3", "4", "5", "6"],
            // [4,4]
            ["1", "2", "3", "4", "5", "6"],
            // [4,5]
            ["1", "2", "3", "4", "5", "6"],
            // [4,6]
            ["1", "2", "3", "4", "5", "6"]
        ],
        // Science and Technology [2]
            [
                // [2,1]
                    ["scat11", "2", "3", "4", "5", "6"],
                // [2,2]
                    ["scat21", "2", "3", "4", "5", "6"],
                // [2,3]
                    ["scat31", "2", "3", "4", "5", "6"],
                // [2,4]
                    ["1", "2", "3", "4", "5", "6"],
                // [2,5]
                    ["1", "2", "3", "4", "5", "6"],
                // [2,6]
                    ["1", "2", "3", "4", "5", "6"]
            ],
        // Language, Lit, and Comm [5]
            [
                // [5,1]
                    ["1", "2", "3", "4", "5", "6"],
                // [5,2]
                    ["1", "2", "3", "4", "5", "6"],
                // [5,3]
                    ["1", "2", "3", "4", "5", "6"],
                // [5,4]
                    ["1", "2", "3", "4", "5", "6"],
                // [5,5]
                    ["1", "2", "3", "4", "5", "6"],
                // [5,6]
                    ["1", "2", "3", "4", "5", "6"]
            ],
        // Health and Wellbeing  [1]
        [
            // Phyiscal Activity [1,1]
            ["Why physical activity is important", "Types of physical activities", "The role of muscles", "How to properly stretch", "Physical and emotional changes when active", "How the heart works"],
            // Diet and Nutrition [1,2]
            ["dan1", "dan2", "dan3", "dan4", "dan5", "dan6"],
            // Mental Wellbeing [1,3]
            ["mw1", "mw2", "mw3", "mw4", "mw5", "mw6"],
            // Healthy Lifestyle [1,4]
            ["1", "2", "3", "4", "5", "6"],
            // Social Awareness [1,5]
            ["1", "2", "3", "4", "5", "6"],
            // Healthy Relationships [1,6]
            ["1", "2", "3", "4", "5", "6"]
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return areaCategories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = areaCategories[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        let vc = storyboard?.instantiateViewController(withIdentifier: "ActivityTableViewController") as? ActivityTableViewController
        vc?.activities = activityData[categoryID][indexPath.row]
        vc?.areaName = areaName
        vc?.categoryName = areaCategories[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
