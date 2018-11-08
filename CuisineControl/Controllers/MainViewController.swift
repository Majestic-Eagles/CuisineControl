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
        
        //let upc = "0638102201010"
        //SpoonacularAPIManager.shared.getFoodDataWithUPC(upc: upc)
        //EdamamAPIManager.shared.getFoodDataWithUPC(upc: upc)
        //UPCItemAPIManager.shared.getUPC(UPC: upc)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let button1 = UIBarButtonItem(title: "Scan new food", style: .plain, target: self, action: #selector(handleNewScan))
        self.tabBarController?.navigationItem.rightBarButtonItem = button1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    @IBAction func scanNewItem(_ sender: Any) {
        self.performSegue(withIdentifier: "ScannerSegue", sender: nil)
    }
    
    @objc func handleNewScan() {
        
        self.performSegue(withIdentifier: "ScannerSegue", sender: nil)
        
    }
    
}
