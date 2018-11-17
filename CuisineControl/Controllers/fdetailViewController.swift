//
//  fdetailViewController.swift
//  CuisineControl
//
//  Created by Sierra Klix on 11/17/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit
import Parse

class fdetailViewController: UIViewController {
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var cal: UILabel!
    @IBOutlet weak var tFat: UILabel!
    @IBOutlet weak var tCarb: UILabel!

    @IBOutlet weak var protein: UILabel!
    
    var food:PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNutrionLabels()
        // Do any additional setup after loading the view.
    }
    func setNutrionLabels(){
        MainLabel.text = food.object(forKey: "name") as! String
        cal.text = String("\(food.object(forKey: "calories")!)")
        tFat.text = String("\(food.object(forKey: "fat")!)g")
        tCarb.text = String("\(food.object(forKey: "carbohydrates")!)g")
        protein.text = String("\(food.object(forKey: "protein")!)g")
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
