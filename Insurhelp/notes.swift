//
//  notes.swift
//  Insurhelp
//
//  Created by George on 25/11/2017.
//  Copyright © 2017 George Zaimis. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class notesen: UITableViewCell{
    
    @IBOutlet var img: UIImageView!
    
    @IBOutlet var property: UILabel!
    @IBOutlet var title: UILabel!
}

class notes: UITableViewController {

    
    var ref:FIRDatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()

        let user  = FIRAuth.auth()?.currentUser?.uid
        ref = FIRDatabase.database().reference()        
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (NoteDic?["Num"] as! Int) + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? notesen

        let note = NoteDic[String(describing: indexPath.row)] as! NSDictionary
        cell?.title.text = note["name"] as! String
        let type = note["type"] as! String
        if type == "car"{
            cell?.img.image = #imageLiteral(resourceName: "icons8-car-50.png")
        }else if (type == "bike"){
            cell?.img.image = #imageLiteral(resourceName: "icons8-motorcycle-filled-50.png")
        }else if (type == "health"){
            cell?.img.image = #imageLiteral(resourceName: "icons8-hospital-filled-50.png")
        }else if (type == "home"){
            cell?.img.image = #imageLiteral(resourceName: "icons8-home-filled-50.png")
        }

        return cell!
    }
 
    @IBAction func addNote(_ sender: Any) {
        
        
        
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
