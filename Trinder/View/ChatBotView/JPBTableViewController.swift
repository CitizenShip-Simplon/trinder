//
//  JPBTableViewController.swift
//  Trinder
//
//  Created by james benn on 12/12/2019.
//  Copyright © 2019 alexandre rodriguez. All rights reserved.
//

import UIKit

class JPBTableViewController: UITableViewController {

    @IBOutlet weak var Message: UILabel!
    
    @IBOutlet weak var Map: UIImageView!
  
    @IBOutlet weak var Icon: UIImageView!
    
    
    let msgDechetterie: String = "Apporte ton objet ici:"
 
    let mapDechetterie = UIImage(named: "mapdechetterie")
    
    let iconDechetterie = UIImage(named: "dechetterie")
    

    let msgRepair: String = "Voici un réparateur dans tes environs."
 
    let maprepair = UIImage(named: "maprepair")
    
    let iconrepair = UIImage(named: "icondechetterie")
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    if prescreen = dechetterie (){
    Message.text = msgDechetterie.text
    && Map.image = UIImage(named: "mapDechetterie.image"
    && Icon.image = UIImage(named: "icondechetterie")
    } else {
      Message.text = msgRepair.text
      && Map.image = UIImage(named: "mapRepair.image"
      && Icon.image = UIImage(named: "iconrepair")
}
  
//    if prescreen = dechetterie ()  {msgDechetterie.Message.text, mapDechetterie, iconrepair}
    
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    

//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
