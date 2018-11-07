//
//  myFoodViewController.swift
//  CuisineControl
//
//  Created by Sierra Klix on 11/5/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController /*UITableViewDataSource, UITableViewDelegate*/ {
    /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }*/
    

    @IBOutlet weak var foodTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
    }

}
