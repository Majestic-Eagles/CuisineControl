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
    
    
     var myGreen = UIColor(red: 30/255, green: 224/255, blue: 121/255, alpha: 1)
    
    
    @IBOutlet weak var signInBut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        makePretty()
    }
    
    func makePretty(){
        usernameField.layer.borderWidth = 1
        usernameField.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        passwordField.layer.borderWidth = 1
        passwordField.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        signInBut.backgroundColor = myGreen
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

