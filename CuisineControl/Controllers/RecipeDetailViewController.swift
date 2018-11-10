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
    
    var recipe: Recipe?

    override func viewDidLoad() {
        super.viewDidLoad()

        recipeImageView.af_setImage(withURL: (recipe?.recipeImageURL)!)
        recipeTitleLabel.text = recipe?.name
        ingredientsListLabel.text = recipe?.ingredients
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipeWebViewController = segue.destination as? RecipeWebViewController {
            recipeWebViewController.recipe = recipe
        }
    }

}
