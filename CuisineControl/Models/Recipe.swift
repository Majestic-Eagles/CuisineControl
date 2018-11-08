//
//  Recipe.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 10/24/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import Foundation
import UIKit

class Recipe {
    
    var ingredients: [Food]?
    var name: String
    var recipeImageURL: URL!
    var calories: NSNumber
    var protein: NSNumber
    var fat: NSNumber
    var carbohydrates: NSNumber
    var instructions: String!
    //var isAvailable: Bool!
    //var isMissing: [Food]?
    var cookTime: NSNumber
    
    init(dictionary: [String: Any]) {
        let recipeDictionary = dictionary["recipe"] as! [String: Any]
        let nutritionDictionary = recipeDictionary["totalNutrients"] as! [String: Any]
        let fatDictionary = nutritionDictionary["FAT"] as! [String: Any]
        let proteinDictionary = nutritionDictionary["PROCNT"] as! [String: Any]
        let carbDictionary = nutritionDictionary["CHOCDF"] as! [String: Any]
        //print(recipeDictionary["calories"])
        //print(recipeDictionary.keys)
        //print(nutritionDictionary)
        name = recipeDictionary["label"] as! String
        recipeImageURL = URL(string: recipeDictionary["image"] as! String)
        calories = recipeDictionary["calories"] as! NSNumber
        cookTime = recipeDictionary["totalTime"] as! NSNumber
        fat = fatDictionary["quantity"] as! NSNumber
        protein = proteinDictionary["quantity"] as! NSNumber
        carbohydrates = carbDictionary["quantity"] as! NSNumber
        /*
        print("name: ", name)
        print("recipeImageURL: ", recipeImageURL)
        print("calories: ", calories)
        print("cookTime: ", cookTime)
        print("fat: ", fat)
        print("protein: ", protein)
        print("carbohydrates: ", carbohydrates)
        */
    }
    
    
}
