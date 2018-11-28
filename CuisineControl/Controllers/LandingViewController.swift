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
    
    var myGreen = UIColor(red: 71/255, green: 227/255, blue: 40/255, alpha: 1)
    var signInButtonBottomConstraint: NSLayoutConstraint!
    
    @objc func handleCreateAccount(sender: UIButton) {
        
    }
    @objc func handleSignIn(sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let createAccountButton = UIButton(type: .system)
        let signInButton = UIButton(type: .system)
        createAccountButton.addTarget(self, action: #selector(handleCreateAccount), for: .touchUpInside)
        
        view.addSubview(createAccountButton)
        view.addSubview(signInButton)
        
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        createAccountButton.backgroundColor = myGreen
        createAccountButton.tintColor = UIColor.white
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.layer.cornerRadius = 5
        signInButton.backgroundColor = UIColor.white
        signInButton.tintColor = UIColor.darkGray
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.layer.cornerRadius = 5
        createAccountButton.alpha = 1
        signInButton.alpha = 1
        
        setConstraints(signInButton: signInButton, createAccountButton: createAccountButton)
        
        let signInBottomConstraint = signInButton.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -30)
        UIView.animate(withDuration: 50) {
            self.view.layoutIfNeeded()
        }

//        UIView.animate(withDuration: 50) {
//           createAccountButton.center.y = createAccountButton.center.y / (self.view.frame.height / 5)
//            signInButton.center.y = signInButton.center.y / (self.view.frame.height / 5)
//        }
        
        
        
        
    }
    
    func setConstraints(signInButton: UIButton, createAccountButton: UIButton) {
        
//        let signInButtonLeftConstraint = NSLayoutConstraint(item: signInButton, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 12)
//        let signInButtonRightConstraint = NSLayoutConstraint(item: signInButton, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -12)
//
//        createAccountButton.addConstraints(<#T##constraints: [NSLayoutConstraint]##[NSLayoutConstraint]#>)
        
        
        createAccountButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        createAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        createAccountButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createAccountButton.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -8).isActive = true
        signInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signInButton.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -30).isActive = true
        
    }
    

}
