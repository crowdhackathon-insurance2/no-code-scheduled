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

class NoteDetail: UIViewController {

    @IBOutlet var id: UILabel!
    @IBOutlet var comp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        id.text = ContractIdNote
        comp.text = CompanieNote
        
        
        
    }
    

    

}
