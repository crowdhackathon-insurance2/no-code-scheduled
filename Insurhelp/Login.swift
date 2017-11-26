//
//  Login.swift
//  Insurhelp
//
//  Created by George on 25/11/2017.
//  Copyright © 2017 George Zaimis. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Login: UIViewController {

    @IBOutlet var User: UITextField!
    @IBOutlet var Pass: UITextField!
    
    var ref: DatabaseReference!
    var test : Int!
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=48ec04b68ec64f2f8df05bca367704ab&q=car&sort=newest")
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if(error != nil){
                print("error")
            }else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
                    
                    OperationQueue.main.addOperation({
                        jsong = json["response"] as! NSDictionary
                    })
                    
                }catch let error as NSError{
                    print(error)
                }
            }
        }).resume()

        
        ref = Database.database().reference()
        //LogIn(self.view)
        
    }

    @IBAction func LogIn(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: User.text!, password: Pass.text!) { (user, error) in
            if error != nil{
                print("ggg")
                return
            }else{
                print("success")
                let user = Auth.auth().currentUser?.uid
                self.ref.child(user!).child("Notes").observeSingleEvent(of: .value, with: { (snapshot) in
                    NoteDic = snapshot.value as! NSDictionary
                })
                self.ref.child(user!).observeSingleEvent(of: .value, with: { (snapshot) in
                    UserDic = snapshot.value as? NSDictionary
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
