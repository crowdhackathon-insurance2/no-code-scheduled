//
//  Account.swift
//  
//
//  Created by George on 26/11/2017.
//

import UIKit

class Account: UIViewController {

    @IBOutlet weak var fName: UILabel!
    @IBOutlet weak var Imag: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Imag.layer.cornerRadius = Imag.frame.size.width/2
        Imag.clipsToBounds = true
        fName.text = UserDic["Full Name"] as! String
        
    }

    

}
