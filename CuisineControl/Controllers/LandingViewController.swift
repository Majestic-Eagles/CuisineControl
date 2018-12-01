//
//  LandingViewController.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 11/22/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var createAccount: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    var myGreen = UIColor(red: 71/255, green: 227/255, blue: 40/255, alpha: 1)
    var fadeTrans: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set_up()
        UIView.animate(withDuration: 1, animations: {
            self.buttonsView.transform = CGAffineTransform(translationX: 0, y: -250)
        })
        
 
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationViewController = segue.destination
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
            
            fadeTrans = FadeTransition()
         destinationViewController.transitioningDelegate = fadeTrans
            
            // Adjust the transition duration. (seconds)
            fadeTrans.duration = 1
            
        
    }
    func set_up(){
        signInButton.backgroundColor = myGreen
        signInButton.layer.cornerRadius = 5
        createAccount.layer.cornerRadius = 5
    }
    
    
    

}
