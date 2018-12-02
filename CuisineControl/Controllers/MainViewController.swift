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
    
    var myGreen = UIColor(red: 30/255, green: 224/255, blue: 121/255, alpha: 1)
    
    var foods:[PFObject] = []
    var refresh : UIRefreshControl!
    var xstarted:CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(getFoods), for: .valueChanged)
        foodTable.insertSubview(refresh, at: 0)
        
        foodTable.dataSource = self
        foodTable.delegate = self
        print("Foods that belong to \(PFUser.current()?.username!)")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getFoods()
    }
    
    @objc func getFoods(){
        let query = PFQuery(className: "Foods")
        if let user = PFUser.current(){
            query.whereKey("user", equalTo: user)
            query.findObjectsInBackground(block: {(foods, error) in
                if let foods = foods{
                    if(foods != self.foods){
                        self.foods = foods
                        self.foodTable.reloadData()
                        self.refresh.endRefreshing()
                    }
                }else if let error = error{
                    print(error.localizedDescription)
                }
            })
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            let cell = self.foodTable.cellForRow(at: indexPath) as? FoodCell
            let food = cell?.food
            food?.deleteInBackground(block: {(succes, error) in
                if(succes){
                    self.getFoods()
                }else{
                    print(error?.localizedDescription)
                }
            })
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodTable.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodCell
        cell.index = indexPath
        cell.food = foods[indexPath.row]
        return cell
    }
   /* @IBAction func getInfo(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "fdetailSegue", sender: sender.view)
    }
    
    @IBAction func swipeDelete(_ sender: UIPanGestureRecognizer) {
        if let cell = sender.view as? FoodCell{
            let translation = sender.translation(in: foodTable.cellForRow(at: cell.index)?.contentView)
            let modView = foodTable.cellForRow(at: cell.index!)?.contentView
            
        if(sender.state == .began){
            
            xstarted = sender.location(in: modView).x
            
        }else if(sender.state == .changed){
            if(translation.x < 0){
               
                let transAmt = max(-125, Double(translation.x))
                print(transAmt)
                UIView.animate(withDuration: 0, animations: {
                })
                
                if(translation.x < -125){
                    cell.deleteFood(cell)
                }
            }
            
        }else if(sender.state == .ended){
            UIView.animate(withDuration: 0.4, animations: {
                modView?.transform = CGAffineTransform.identity
            })
            }
        }else{
            print(sender.view?.accessibilityIdentifier)
        }
        
    }*/
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        let button1 = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(handleNewScan))
        button1.setBackgroundImage(UIImage(named: "icons8-barcode-26"), for: .normal, barMetrics: .default)
        self.tabBarController?.navigationItem.rightBarButtonItem = button1
        self.tabBarController?.navigationController?.navigationBar.barTintColor = myGreen
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "fdetailSegue"){
            let dest = segue.destination as! fdetailViewController
            if let cell = sender as? FoodCell{
                let food = foods[cell.index.row]
                print(food)
                dest.food = foods[cell.index.row]
            }
            
        }
    }
    
}
