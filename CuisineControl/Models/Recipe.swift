//
//  Recipe.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 10/24/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class Recipe {
    
    var ingredients: [Food]?
    var name: String?
    var recipeImage: UIImage
    var calories: Int?
    var protein: Int?
    var fat: Int?
    var carbohydrates: Int?
    var instructions: String?
    //var isAvailable: Bool!
    //var isMissing: [Food]?
    var cookTime: Int?
    
    init(dictionary: [String: Any]) {
        name = dictionary["label"] as! String
        recipeImage = af_setImage(url: URL(dictionary["image"]))
        
    }
    
    
}
