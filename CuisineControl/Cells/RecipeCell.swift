//
//  RecipeCell.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 11/6/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit
import AlamofireImage

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    var recipe: Recipe! {
        didSet {
            print("Recipe is being set")
            self.recipeImageView.af_setImage(withURL: recipe.recipeImageURL)
            self.recipeNameLabel.text = recipe.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
