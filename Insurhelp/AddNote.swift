//
//  AddNote.swift
//  Insurhelp
//
//  Created by George on 25/11/2017.
//  Copyright © 2017 George Zaimis. All rights reserved.
//

import UIKit

class AddNote: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {

    @IBOutlet var viecleType: UIPickerView!
    @IBOutlet var pickerView: UIPickerView!
    
    let types = ["Car","Motorcycle","Health","Home"]
    var type = "Car"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return types[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        type = types[row]
        print(type)
    }
    
    
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }

    

}
