//
//  RecipeDetailViewController.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 11/9/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit
import Alamofire

class RecipeDetailViewController: UIViewController {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var ingredientsListLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var recipeButton: UIButton!
    
    var recipe: Recipe?

    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationController?.navigationBar.tintColor = UIColor.black
        recipeImageView.af_setImage(withURL: (recipe?.recipeImageURL)!)
        recipeTitleLabel.text = recipe?.name
        ingredientsListLabel.text = recipe?.ingredients
        recipeButton.setTitle("View Recipe", for: .normal)
        recipeButton.tintColor = UIColor.white
        recipeButton.layer.cornerRadius = 5
        recipeButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        recipeButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        recipeButton.layer.shadowOpacity = 1.0
        recipeButton.layer.shadowRadius = 0.0
        recipeButton.layer.masksToBounds = false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipeWebViewController = segue.destination as? RecipeWebViewController {
            recipeWebViewController.recipe = recipe
        }
    }

}
