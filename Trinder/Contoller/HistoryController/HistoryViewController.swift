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
    
  
        var itemsInSections: Array<Array<UIImage>> = [[#imageLiteral(resourceName: "banaba"), #imageLiteral(resourceName: "banaba"), #imageLiteral(resourceName: "wineGlass")], [#imageLiteral(resourceName: "amazonBox"), #imageLiteral(resourceName: "cornFlakesBox")], [#imageLiteral(resourceName: "wineGlass"), #imageLiteral(resourceName: "wineGlass"), #imageLiteral(resourceName: "wineGlass"), #imageLiteral(resourceName: "wineGlass"), #imageLiteral(resourceName: "wineGlass")], [#imageLiteral(resourceName: "glasses"), #imageLiteral(resourceName: "meet"), #imageLiteral(resourceName: "banaba")]]
    var iremsDictionnary = ["House Trash" : [#imageLiteral(resourceName: "banaba"), #imageLiteral(resourceName: "banaba"), #imageLiteral(resourceName: "wineGlass")], "recycle trash": [#imageLiteral(resourceName: "amazonBox"), #imageLiteral(resourceName: "cornFlakesBox")], "glass trash": [#imageLiteral(resourceName: "wineGlass"), #imageLiteral(resourceName: "wineGlass"), #imageLiteral(resourceName: "wineGlass"), #imageLiteral(resourceName: "wineGlass"), #imageLiteral(resourceName: "wineGlass")], "dechetery": [#imageLiteral(resourceName: "glasses"), #imageLiteral(resourceName: "meet"), #imageLiteral(resourceName: "banaba")] ]
        var sections: Array<String> = ["House trash", "recycle trash", "glass trash", "dechetery"]
        var iconTrash: [UIImage] = [#imageLiteral(resourceName: "trashBrown"), #imageLiteral(resourceName: "trashYellow"), #imageLiteral(resourceName: "trashGreen"), #imageLiteral(resourceName: "traskTruck")]
 
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let dest = segue.destination as? HistoryDetailViewController, let index = collectionView.indexPathsForSelectedItems?.first {
            dest.itemsOfSection = itemsInSections[index.section][index.row]
            print("Segue prepare")
        }

    }
    
}
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
     
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath)
        performSegue(withIdentifier: "Segue", sender: selectedCell)
        print("segue performe")
        
    
    }
    
 
    

}
























//        func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//            return self.sections[section]
//        }
