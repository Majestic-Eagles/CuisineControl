//
//  FavoriteRecipesViewController.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 11/17/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit

class FavoriteRecipesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var recipes: [Recipe] = []
    //var loadingView: NVActivityIndicatorView?
    var shadowView: UIView?
    var myGreen = UIColor(red: 71/255, green: 227/255, blue: 40/255, alpha: 1)
    
    @IBOutlet weak var favoriteRecipesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        cell.recipe = recipes[indexPath.row]
        return cell
    }
    
    
    
}
