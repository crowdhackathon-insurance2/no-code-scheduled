//
//  Validate.swift
//  Insurhelp
//
//  Created by George on 26/11/2017.
//  Copyright © 2017 George Zaimis. All rights reserved.
//

import UIKit



class Validate: UIViewController {

    @IBOutlet weak var scrollView: UILabel!
    @IBOutlet weak var procced: UIButton!
    @IBOutlet weak var cancel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.text = "First Name: John\nLast Name: Appleseed\nAddress: Agg. Sikeianou \nNumber: 3\nPostal Code: 15126\n...\n..."
        procced.layer.cornerRadius = 5
        procced.clipsToBounds = true
        cancel.layer.cornerRadius = 5
        cancel.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
