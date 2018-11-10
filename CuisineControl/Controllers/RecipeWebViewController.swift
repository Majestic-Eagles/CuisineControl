//
//  RecipeWebViewController.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 11/9/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit
import WebKit

class RecipeWebViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var recipeWebView: WKWebView!
    
    var recipe: Recipe?
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        recipeWebView = WKWebView(frame: .zero, configuration: webConfiguration)
        recipeWebView.uiDelegate = self
        view = recipeWebView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let recipeURL = recipe?.recipeURL
        let request = URLRequest(url: recipeURL!)
        recipeWebView.load(request)
        
    }

}
