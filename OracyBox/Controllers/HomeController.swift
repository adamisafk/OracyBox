//
//  HomeController.swift
//  OracyBox
//
//  Created by Adam Howells on 28/02/2020.
//  Copyright © 2020 Adam Howells. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class HomeController: UIViewController {
    
    var areaOfLearnings = [String]()
    var categories = [String]()
    let curriculumController = CurriculumController()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.isUserInteractionEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension HomeController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return areaOfLearnings.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "areaOfLearning", for: indexPath) as! CollectionController
        cell.cellText.text = areaOfLearnings[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row + 1) // id of subject selected
        // pass through data
        curriculumController.getTopics(subjectId: String(indexPath.row + 1)) { (json) in
            for (_, subJson):(String, JSON) in json {
                self.categories.append(subJson["name"].stringValue)
            }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CategoryTableViewController") as? CategoryTableViewController
            vc?.areaName = self.areaOfLearnings[indexPath.row]
            vc?.areaCategories = self.categories
            vc?.categoryID = indexPath.row + 1
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
