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
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension HomeController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return areaOfLearnings.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "areaOfLearning", for: indexPath) as! CollectionController
        cell.cellText.text = areaOfLearnings[indexPath.row]
        return cell
    }
}
