//
//  ViewController.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 10/8/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    EdamamAPIManager.shared.getFoodData(foodString: "zone fudge gram protein bar")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUp(_ sender: Any) {
        let newUser = PFUser()
        if(usernameField.text! == "" || passwordField.text! == ""){
            let misingInputalert = UIAlertController(title: "Missing Input", message: "Username or password is empty", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            misingInputalert.addAction(OKAction)
            present(misingInputalert, animated: true)
        }else{
            
            // set user properties
            newUser.username = usernameField.text
            newUser.password = passwordField.text
            
            // call sign up function on the object
            newUser.signUpInBackground { (success: Bool, error: Error?) in
                if let error = error {
                    let errorAlert = UIAlertController(title:"Error", message: error.localizedDescription, preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        
                    }
                    errorAlert.addAction(OKAction)
                    
                    self.present(errorAlert, animated: true)
                } else {
                    print("User Registered successfully")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    // manually segue to logged in view
                }
            }
    }
    }
    @IBAction func signIn(_ sender: Any) {
        if(usernameField.text! == "" || passwordField.text! == ""){
            let misingInputalert = UIAlertController(title: "Missing Input", message: "Username or password is empty", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            misingInputalert.addAction(OKAction)
            present(misingInputalert, animated: true)
        }else{
            let usernameT = usernameField.text ?? ""
            let passwordT = passwordField.text ?? ""
            
            PFUser.logInWithUsername(inBackground: usernameT , password: passwordT)
            { (user: PFUser?, error: Error?) in
                if let error = error {
                    let errorAlert = UIAlertController(title:"Error", message: error.localizedDescription, preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        
                    }
                    errorAlert.addAction(OKAction)
                    
                    self.present(errorAlert, animated: true)
                } else {
                    print("User logged in successfully")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    // display view controller that needs to shown after successful login
                }
            }
            
            
        }
        
    }
        
    

}

