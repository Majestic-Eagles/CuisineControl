//
//  CreateAccountViewController.swift
//  CuisineControl
//
//  Created by Sierra Klix on 12/1/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var cAccountBut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func makePretty(){
        let black = UIColor(white: 0, alpha: 0.4).cgColor as CGColor
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = black
        nameField.layer.borderWidth = 1
        nameField.layer.borderColor = black
        passwordField.layer.borderW
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
