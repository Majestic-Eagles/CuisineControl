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
    
    var ingredients = ""
    var name: String
    var recipeImageURL: URL!
    var recipeURL: URL!
    var calories: NSNumber
    var protein: NSNumber
    var fat: NSNumber
    var carbohydrates: NSNumber
    var cookTime: NSNumber
    
    init(dictionary: [String: Any]) {
        print(dictionary)
        print("Recipes are being initialized")
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
        let ingredientsArray = recipeDictionary["ingredientLines"] as! NSArray
        for ingredient in ingredientsArray {
            ingredients += ingredient as! String
            ingredients += "\n"
        }
        recipeURL = URL(string: recipeDictionary["url"] as! String)
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
