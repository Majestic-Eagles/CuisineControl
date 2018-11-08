//
//  myFoodViewController.swift
//  CuisineControl
//
//  Created by Sierra Klix on 11/5/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit
import Parse

class RecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var recipes: [Recipe] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        cell.recipe = recipes[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let button1 = UIBarButtonItem(title: "Random Recipe", style: .plain, target: self, action: #selector(handleRandomRecipe))
        self.tabBarController?.navigationItem.rightBarButtonItem = button1
    }
    
    @objc func handleRandomRecipe() {
        print("Button Function ran!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        EdamamAPIManager.shared.getRandomRecipe(user: PFUser.current()!, numberOfRecipes: 5) { (recipes, error) in
            print("Completion Block Running!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
            if let recipes = recipes {
                print("Recipes successfully loaded!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                self.recipes = recipes
                self.recipeTableView.reloadData()
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
    }

}
