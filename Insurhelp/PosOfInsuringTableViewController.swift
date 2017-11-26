//
//  PosOfInsuringTableViewController.swift
//  Insurhelp
//
//  Created by George on 25/11/2017.
//  Copyright © 2017 George Zaimis. All rights reserved.
//

import UIKit

class PosCellInsuring: UITableViewCell {
    
    
    @IBOutlet var vtype: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var desc: UILabel!
    
}

class PosOfInsuringTableViewController: UITableViewController {

    let types = ["Car","Motorcycle","Health","Home"]
    let adesc = ["","","",""]
    let imga = [#imageLiteral(resourceName: "car rounf.png"),#imageLiteral(resourceName: "bike round.png"),#imageLiteral(resourceName: "health round.png"),#imageLiteral(resourceName: "home round.png")]

    override func viewDidLoad() {
        super.viewDidLoad()

        let h: CGFloat = self.view!.bounds.height
        let h2: CGFloat = self.tabBarController!.tabBar.frame.height
        let h3: CGFloat = (self.navigationController?.navigationBar.frame.height)!
        let reald: CGFloat = (((h-h2)-h3)/4 ) - 5
        tableView.rowHeight = reald
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return types.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PosCellInsuring

        cell?.vtype.text = types[indexPath.row]
        cell?.desc.text = adesc[indexPath.row]
        cell?.img.image = imga[indexPath.row]

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        InsuringPosOfCons = types[indexPath.row]
        performSegue(withIdentifier: "plan", sender: tableView)
        
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
