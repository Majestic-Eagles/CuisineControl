//
//  MainViewController.swift
//  CuisineControl
//
//  Created by Sierra Klix on 10/27/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit
import Parse

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func logOut(_ sender: Any) {
        PFUser.logOutInBackground()
        self.performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    
    @IBAction func scanNewItem(_ sender: Any) {
        self.performSegue(withIdentifier: "ScannerSegue", sender: nil)
    }
    
}