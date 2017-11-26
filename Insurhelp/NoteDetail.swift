//
//  NoteDetail.swift
//  Insurhelp
//
//  Created by George on 25/11/2017.
//  Copyright © 2017 George Zaimis. All rights reserved.
//

import UIKit

public var ContractIdNote: String!
public var CompanieNote: String!
public var Name: String!

class NoteDetail: UIViewController {

    @IBOutlet var id: UILabel!
    @IBOutlet var comp: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var remove: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        add.layer.cornerRadius = 5
        remove.layer.cornerRadius = 5
        add.clipsToBounds = true
        remove.clipsToBounds = true
        
        id.text = ContractIdNote
        comp.text = CompanieNote
        name.text = Name
        
    }
    

    

}
