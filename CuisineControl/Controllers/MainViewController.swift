//
//  MainViewController.swift
//  CuisineControl
//
//  Created by Sierra Klix on 10/27/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit
import Parse

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
   
    
    @IBOutlet weak var foodTable: UITableView!
    
    var foods:[PFObject]! = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodTable.dataSource = self
        foodTable.delegate = self
        print("Foods that belong to \(PFUser.current()?.username!)")
        getFoods()
        //let upc = "0638102201010"
        //SpoonacularAPIManager.shared.getFoodDataWithUPC(upc: upc)
        //EdamamAPIManager.shared.getFoodDataWithUPC(upc: upc)
        //UPCItemAPIManager.shared.getUPC(UPC: upc)
        
    }
    @objc func getFoods(){
        let query = PFQuery(className: "Foods")
        query.whereKey("user", equalTo: PFUser.current()!)
        query.findObjectsInBackground(block: {(foods, error) in
            if let foods = foods{
                self.foods = foods
                self.foodTable.reloadData()
            }else if let error = error{
                print(error.localizedDescription)
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodTable.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodCell
        cell.food = foods[indexPath.row]
        return cell
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
