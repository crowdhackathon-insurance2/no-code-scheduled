//
//  SelectCompany.swift
//  Insurhelp
//
//  Created by George on 25/11/2017.
//  Copyright © 2017 George Zaimis. All rights reserved.
//

import UIKit

public var InsuringPosOfCons: String!

class SslectCompaniesCells: UITableViewCell {
    
    
    @IBOutlet var comp: UILabel!
    @IBOutlet var img: UIImageView!
    
    
}


class SelectCompany: UITableViewController {

    let companies = ["Eurolife","Anytime","AXA","NN"]
    let imga = [#imageLiteral(resourceName: "EUROLIFEfairfax-logo-01.png"),#imageLiteral(resourceName: "Screen Shot 2017-11-26 at 00.18.28.png"),#imageLiteral(resourceName: "axa_logo_solid_208.png"),#imageLiteral(resourceName: "mm_logo-01.png")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SslectCompaniesCells

        cell.img.image = imga[indexPath.row]
        cell.comp.text = companies[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        CompI = companies[indexPath.row]
        performSegue(withIdentifier: "info", sender: tableView)
        
    }

}
