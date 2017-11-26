//
//  Info.swift
//  Insurhelp
//
//  Created by George on 26/11/2017.
//  Copyright © 2017 George Zaimis. All rights reserved.
//

import UIKit

public var CompI: String!

class Info: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let types = ["2 cycle trailer","4 cycle trailer","Caravan","Trailer"]
    var type = "0"

    @IBOutlet var CompanTitle: UILabel!
    @IBOutlet var Options: UISegmentedControl!
    @IBOutlet var TrailerPicker: UIPickerView!
    @IBOutlet var CountField: UITextField!
    @IBOutlet var Data: UIDatePicker!
    @IBOutlet var SegmentedTrailer: UISegmentedControl!
    @IBOutlet var CountrySegmented: UISegmentedControl!
    @IBOutlet var NextBtn: UIButton!
    
    var getCountry = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        CompanTitle.text = CompI
        if CompI == "Anytime"{
            Options.setTitle("No Mile Limitation", forSegmentAt: 0)
            Options.setTitle("BuyTheMile", forSegmentAt: 1)
            Options.setImage(#imageLiteral(resourceName: "anytime-btm-logo.png"), forSegmentAt: 1)
        }
        NextBtn.layer.cornerRadius = 5
        NextBtn.clipsToBounds = true
        
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
    }

    @IBAction func segmented(_ sender: Any) {
        
        if SegmentedTrailer.selectedSegmentIndex == 0{
            TrailerPicker.isHidden = false
        }else if SegmentedTrailer.selectedSegmentIndex == 1{
            TrailerPicker.isHidden = true
            type = "0"
        }
        
    }
    @IBAction func FirstReg(_ sender: Any) {
        
        if CountrySegmented.selectedSegmentIndex == 0{
            CountField.isHidden = false
            getCountry = true
        }else if CountrySegmented.selectedSegmentIndex == 1{
            CountField.isHidden = true
            getCountry = false
        }
    }
    
    @IBAction func Next(_ sender: Any) {
        
        performSegue(withIdentifier: "validate", sender: self.view)
        
    }
}
