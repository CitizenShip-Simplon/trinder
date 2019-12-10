//
//  HistoryViewController.swift
//  Trinder
//
//  Created by Caroline Zaini on 04/12/2019.
//  Copyright © 2019 alexandre rodriguez. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
 
    // select and Change if needed:
    var itemsInSections: Array<Array<UIImage>> = [[#imageLiteral(resourceName: "meet"), #imageLiteral(resourceName: "banaba"), #imageLiteral(resourceName: "ananas")], [#imageLiteral(resourceName: "amazonBox"), #imageLiteral(resourceName: "canOfCoke"), #imageLiteral(resourceName: "paper"), #imageLiteral(resourceName: "cornFlakesBox")], [#imageLiteral(resourceName: "wineGlass"), #imageLiteral(resourceName: "bottleOfWine"), #imageLiteral(resourceName: "shotGlasses")], [#imageLiteral(resourceName: "painting"), #imageLiteral(resourceName: "alarmClock"), #imageLiteral(resourceName: "mirror")]]
 
    var sections: Array<String> = ["House trash", "recycle trash", "glass trash", "dechetery"]
    var iconTrash: [UIImage] = [#imageLiteral(resourceName: "trashBrown"), #imageLiteral(resourceName: "trashYellow"), #imageLiteral(resourceName: "trashGreen"), #imageLiteral(resourceName: "traskTruck")]

    var itemSelected: UIImage!
    var iconTrashSelected: UIImageView!

    let layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
      
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "Segue" {
            let nextVC = segue.destination as! HistoryDetailViewController
         
            nextVC.imagePassed = itemSelected
//          nextVC.iconTrash = iconTrashSelected
        }
    }
}

// MARK:- collectionView's methods

extension HistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Reuse", for: indexPath) as! HistoryReusableView
    
        headerView.titleSectionLabel.text = sections[indexPath.section]
        headerView.iconTrash.image = iconTrash[indexPath.section]
                return headerView
    }
    
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
        
        itemSelected = image
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "Segue", sender: self)
  
    }

}


























