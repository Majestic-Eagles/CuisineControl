//
//  Recipe.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 10/24/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import Foundation

class Recipe {
    
    var ingredients: [Food]?
    var name: String?
    var description: String?
//    var foodImage:
    var calories: Int?
    var protein: Int?
    var fat: Int?
    var carbohydrates: Int?
    var instructions: String?
    var isAvailable: Bool!
    var isMissing: [Food]?
    var cookTime: Int?
    
    
}
