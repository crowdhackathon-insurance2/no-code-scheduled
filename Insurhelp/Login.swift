//
//  Login.swift
//  Insurhelp
//
//  Created by George on 25/11/2017.
//  Copyright © 2017 George Zaimis. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class Login: UIViewController {

    @IBOutlet var User: UITextField!
    @IBOutlet var Pass: UITextField!
    
    var ref: FIRDatabaseReference!
    var test : Int!
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        ref = FIRDatabase.database().reference()
        LogIn(self.view)
        
    }

    @IBAction func LogIn(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: User.text!, password: Pass.text!) { (user, error) in
            if error != nil{
                print("ggg")
                return
            }else{
                print("success")
                let user = FIRAuth.auth()?.currentUser?.uid
                self.ref.child(user!).observeSingleEvent(of: .value, with: { (snapshot) in
                    UserDic = snapshot.value as? NSDictionary
                    print(UserDic)
                })
                self.ref.child(user!).child("Notes").observeSingleEvent(of: .value, with: { (snapshot) in
                    NoteDic = snapshot.value as? NSDictionary
                })
                //self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.sayHello), userInfo: nil, repeats: true)
                self.performSegue(withIdentifier: "Login", sender: self.view)
                return
            }
        }
        
    }
    
    @objc func sayHello(){
        ref.child("Emerg").observeSingleEvent(of: .value, with: { (snapshot) in
            AccidentDic = snapshot.value as? NSDictionary
            let value = AccidentDic?["Num"] as! Int
            if self.test == nil{
                self.test = value
            }else if self.test < value{
                
                NotificationCenter.default.post(NSNotification(name: NSNotification.Name(rawValue: "segue"), object: nil) as Notification)
                
                self.timer?.invalidate()
            }
        })
        return
    }
    
}
