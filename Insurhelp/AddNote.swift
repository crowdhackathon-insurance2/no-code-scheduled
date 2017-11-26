//
//  AddNote.swift
//  Insurhelp
//
//  Created by George on 25/11/2017.
//  Copyright © 2017 George Zaimis. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class AddNote: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {

    @IBOutlet var viecleType: UIPickerView!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var addBtn: UIButton!
    @IBOutlet var name: UITextField!
    @IBOutlet var contractId: UITextField!
    @IBOutlet var comp: UITextField!
    
    let types = ["Car","Motorcycle","Health","Home"]
    var type = "Car"
    var ref: DatabaseReference!
    var curr: Int!
    let user = Auth.auth().currentUser?.uid
    override func viewDidLoad() {
        super.viewDidLoad()

        addBtn.layer.cornerRadius = 5
        addBtn.clipsToBounds = true
        curr = NoteDic["Num"] as? Int
        ref = Database.database().reference()
        
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
    
    @IBAction func AddNote(_ sender: Any) {
        
        ref.child(user!).child(String(curr + 1)).child("type").setValue(type)
        ref.child(user!).child(String(curr + 1)).child("name").setValue(name.text)
        ref.child(user!).child(String(curr + 1)).child("contract").child("id").setValue(contractId)
        ref.child(user!).child(String(curr + 1)).child("contract").child("name").setValue(comp)
        self.performSegue(withIdentifier: "backToNotes", sender: self.view)
        self.ref.child(user!).observeSingleEvent(of: .value, with: { (snapshot) in
            UserDic = snapshot.value as? NSDictionary
            print(UserDic)
        })
        self.ref.child(user!).child("Notes").observeSingleEvent(of: .value, with: { (snapshot) in
            NoteDic = snapshot.value as? NSDictionary
        })
        
        
    }
    
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }

    

}
