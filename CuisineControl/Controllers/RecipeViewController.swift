//
//  myFoodViewController.swift
//  CuisineControl
//
//  Created by Sierra Klix on 11/5/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit
import Parse
import NVActivityIndicatorView

class RecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    var recipes: [Recipe] = []
    var loadingView: NVActivityIndicatorView?
    var shadowView: UIView?
    var myGreen = UIColor(red: 71/255, green: 227/255, blue: 40/255, alpha: 1)
    
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
        loader.alpha = 0
        loader.transform = CGAffineTransform(scaleX: 3, y: 3)
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        

        var indicatorSize: CGRect = CGRect(x: self.view.bounds.width/2 , y: self.view.bounds.height/2, width: 100, height: 100)
        shadowView = UIView(frame: view.frame)
        loadingView = NVActivityIndicatorView(frame: indicatorSize, type: .lineScalePulseOut, color: myGreen, padding: 0)
    
        self.view.addSubview(shadowView!)
        shadowView?.backgroundColor = UIColor.gray
        shadowView?.layer.masksToBounds = true
        shadowView?.alpha = 0.5
        shadowView?.isHidden = true
        self.view.addSubview(loadingView!)
        loadingView?.isHidden = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let button1 = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(handleRandomRecipe))
            button1.setBackgroundImage(UIImage(named: "icons8-food-24"), for: .normal, barMetrics: .default)
            button1.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.tabBarController?.navigationItem.rightBarButtonItem = button1
    }
    
    @objc func handleRandomRecipe() {
        loader.startAnimating()
        loader.alpha = 1
        if let user = PFUser.current(){
            //self.shadowView?.isHidden = false
            //loadingView!.startAnimating()
            EdamamAPIManager.shared.getRandomRecipe(user: user, numberOfRecipes: 5) { (recipes, error) in
                if let recipes = recipes {
                    //self.shadowView?.isHidden = true
                    //self.loadingView!.stopAnimating()
                    self.recipes = recipes
                    self.recipeTableView.reloadData()
                    self.loader.stopAnimating()
                    self.loader.alpha = 0
                } else if let error = error {
                    print(error.localizedDescription)
                    self.loader.stopAnimating()
                    self.loader.alpha = 0
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            let cell = sender as! RecipeCell
            if let indexPath = recipeTableView.indexPath(for: cell) {
                let recipe = recipes[indexPath.row]
                let recipeDetailViewController = segue.destination as! RecipeDetailViewController
                recipeDetailViewController.recipe = recipe
            }
        }
    }

}
