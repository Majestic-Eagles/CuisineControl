//
//  CreateAccountViewController.swift
//  CuisineControl
//
//  Created by Sierra Klix on 12/1/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit
import Parse

class CreateAccountViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var cAccountBut: UIButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var myGreen = UIColor(red: 30/255, green: 224/255, blue: 121/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.alpha = 0
        makePretty()
        loader.transform = CGAffineTransform(scaleX: 3, y: 3)
    }
    
    func makePretty(){
        let black = UIColor(white: 0, alpha: 0.4).cgColor as CGColor
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = black
        nameField.layer.borderWidth = 1
        nameField.layer.borderColor = black

        passwordField.layer.borderWidth = 1
        passwordField.layer.borderColor = black
        cAccountBut.backgroundColor = myGreen

    }

    @IBAction func signUp(_ sender: Any) {
        loader.alpha = 1
        loader.startAnimating()
        let newUser = PFUser()
        if(nameField.text! == "" || passwordField.text! == "" || emailField.text! == ""){
            loader.stopAnimating()
            loader.alpha = 0
            let misingInputalert = UIAlertController(title: "Missing Input", message: "Username or password is empty", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in }
            misingInputalert.addAction(OKAction)
            present(misingInputalert, animated: true)
        }else{
            
            // set user properties
            newUser.username = emailField.text
            newUser.password = passwordField.text
            newUser.email = emailField.text
            
            // call sign up function on the object
            newUser.signUpInBackground { (success: Bool, error: Error?) in
                if let error = error {
                    self.loader.stopAnimating()
                    self.loader.alpha = 0
                    let errorAlert = UIAlertController(title:"Error", message: error.localizedDescription, preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        
                    }
                    errorAlert.addAction(OKAction)
                    
                    self.present(errorAlert, animated: true)
                } else {
                    print("User Registered successfully")
                    self.loader.stopAnimating()
                    self.loader.alpha = 0
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    // manually segue to logged in view
                }
            }
        }
    }
    
}
