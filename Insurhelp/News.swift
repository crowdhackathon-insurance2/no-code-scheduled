//
//  News.swift
//  Insurhelp
//
//  Created by George on 26/11/2017.
//  Copyright © 2017 George Zaimis. All rights reserved.
//

import UIKit

var webURL = ["","",""]
var deta: Data!
var read = false
class NewsCell: UITableViewCell {
    
    @IBOutlet var NewsLabel: UILabel!
    
}

class News: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 200 / 3
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell

        var snippet: String!

                        
                    let doc = jsong["docs"] as! NSArray
                    let first = doc[(indexPath.row) + 1] as! NSDictionary
                    snippet = first["snippet"] as! String
                    webURL[indexPath.row] = first["web_url"] as! String
                    cell.NewsLabel.text = snippet

        

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: webURL[indexPath.row])!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(URL(string: webURL[indexPath.row])!)
        }
        
        
    }
 

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
