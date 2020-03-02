//
//  HomeController.swift
//  OracyBox
//
//  Created by Adam Howells on 28/02/2020.
//  Copyright © 2020 Adam Howells. All rights reserved.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    
    let areaOfLearnings = ["Expressive Arts", "Humanities", "Maths and Numeracy", "Science and Technology", "Language, Literacy,\nCommunication", "Health and Wellbeing"]
    let categories = [
        ["11", "12", "13", "14", "15", "16", "17", "18"], // expressive arts
        ["21", "22", "23", "24", "25", "26", "27", "28"], // humanities
        ["31", "32", "33", "34", "35", "36", "37", "38"], // maths and numeracy
        ["41", "42", "43", "44", "45", "46", "47", "48"], // science and technology
        ["51", "52", "53", "54", "55", "56", "57", "58"], // language, literacy, communication
        ["Physical Activity", "Diet and Nutrition", "Mental Wellbeing", "Healthy Lifestyle", "Social Awareness", "Healthy Relationships"] // health and wellbeing
    ]
    
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
        print("selected")
        let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryTableViewController") as? CategoryTableViewController
        vc?.areaName = areaOfLearnings[indexPath.row]
        vc?.areaCategories = categories[indexPath.row]
        vc?.categoryID = indexPath.row
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
