//
//  EmergTableViewController.swift
//  Insurtech
//
//  Created by George on 20/11/2017.
//  Copyright © 2017 George Zaimis. All rights reserved.
//

import UIKit

private let Names = ["Police","Ambulance","Fire","Companies and Organazations"]
private let Num = ["100","166","199","Other"]
private let Img = [#imageLiteral(resourceName: "police-car-icon-5642-0.png"),#imageLiteral(resourceName: "ambulance-icon-86015.png"),#imageLiteral(resourceName: "fire.png"),#imageLiteral(resourceName: "form-autre.png")]

class EmergCells: UITableViewCell{
    
    @IBOutlet var Desc: UILabel!
    @IBOutlet var CallID: UILabel!
    @IBOutlet var Img: UIImageView!
    
    
}

class EmergTableViewController: UITableViewController {
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        let h: CGFloat = self.view!.bounds.height
        let h2: CGFloat = self.tabBarController!.tabBar.frame.height
        let reald: CGFloat = (h - h2)/4
        tableView.rowHeight = reald
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Names.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cells")! as! EmergCells
        
        cell.CallID?.text = Num[indexPath.row]
        cell.Desc?.text = Names[indexPath.row]
        cell.Img?.image = Img[indexPath.row]
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index: Int = indexPath.row
        if (index != 3){
            
            self.makeAPhoneCall(text: Num[indexPath.row])
            
        }else if (index == 3){
            
            performSegue(withIdentifier: "emergedetail", sender: tableView)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public func makeAPhoneCall(text: String)  {
        guard let number = URL(string: "tel://" + text) else { return }
        UIApplication.shared.open(number)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

