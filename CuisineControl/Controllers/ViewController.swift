//
//  ViewController.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 10/8/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        EdamamAPIManager.shared.getData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

