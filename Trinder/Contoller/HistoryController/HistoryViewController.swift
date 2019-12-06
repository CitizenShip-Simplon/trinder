//
//  HistoryViewController.swift
//  Trinder
//
//  Created by Caroline Zaini on 04/12/2019.
//  Copyright © 2019 alexandre rodriguez. All rights reserved.
//

import UIKit


struct Item {
    var imageName: String
}

class HistoryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
        
        var itemsInSections: Array<Array<UIImage>> = [[#imageLiteral(resourceName: "PlasticGlass"), #imageLiteral(resourceName: "PlasticGlass"), #imageLiteral(resourceName: "PlasticGlass")], [#imageLiteral(resourceName: "PlasticGlass"), #imageLiteral(resourceName: "PlasticGlass")], [#imageLiteral(resourceName: "PlasticGlass"), #imageLiteral(resourceName: "PlasticGlass"), #imageLiteral(resourceName: "PlasticGlass"), #imageLiteral(resourceName: "PlasticGlass"), #imageLiteral(resourceName: "PlasticGlass")]]
        var sections: Array<String> = ["Section 1", "Section 2", "Section 3"]
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
        }
}
extension HistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return self.itemsInSections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HistoryCell
        
        let image = self.itemsInSections[indexPath.section][indexPath.row]
        
        cell.mainImageView.image = image
        
        return cell
    }
    

        
        func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return self.sections[section]
        }
        
        

    }

