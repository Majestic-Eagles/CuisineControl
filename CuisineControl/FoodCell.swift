//
//  FoodCell.swift
//  CuisineControl
//
//  Created by Sierra Klix on 11/10/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit
import Parse

class FoodCell: UITableViewCell {

    @IBOutlet weak var nameLab: UILabel!
    @IBOutlet weak var expireDate: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    var food:PFObject?{
        didSet{
            nameLab.text = String("\(food?.object(forKey: "name") ?? "")")
            expireDate.text = String("\(food?.object(forKey: "expirationDate") ?? "")")
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func deleteFood(_ sender: Any) {
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
