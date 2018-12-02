//
//  ManualFoodViewController.swift
//  CuisineControl
//
//  Created by Sierra Klix on 12/1/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit
import Parse

class ManualFoodViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var servingSizeTextField: UITextField!
    @IBOutlet weak var caloriesTextField: UITextField!
    @IBOutlet weak var proteinTextField: UITextField!
    @IBOutlet weak var carbohydratesTextField: UITextField!
    @IBOutlet weak var fatTextField: UITextField!
    @IBOutlet weak var expirationDateTextField: UITextField!
    @IBOutlet weak var ingredientSegmentedController: UISegmentedControl!
    @IBOutlet weak var submitFoodButton: UIButton!
    
    private var datePicker = UIDatePicker()
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func clearExpirationDate(_ sender: Any) {
        expirationDateTextField.text = ""
    }
    
    @IBAction func submitNewFood(_ sender: Any) {
        let newFoodObject = PFObject(className: "Foods")
        newFoodObject["servingSize"] = servingSizeTextField.text
        newFoodObject["apiName"] = ""
        newFoodObject["calories"] = Int(caloriesTextField.text!)
        newFoodObject["carbohydrates"] = Int(carbohydratesTextField.text!)
        newFoodObject["protein"] = Int(proteinTextField.text!)
        newFoodObject["fat"] = Int(fatTextField.text!)
        newFoodObject["expirationDate"] = expirationDateTextField.text
        newFoodObject["name"] = nameTextField.text
        if ingredientSegmentedController.selectedSegmentIndex == 0 {
            newFoodObject["isIngredient"] = true
        } else {
            newFoodObject["isIngredient"] = false
        }
        newFoodObject["user"] = PFUser.current()
        newFoodObject.saveInBackground { (succes: Bool, error: Error?) in
            if succes {
                print("The food was saved")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
        self.performSegue(withIdentifier: "ManualSubmit", sender: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitFoodButton.setTitle("Submit New Food", for: .normal)
        submitFoodButton.tintColor = UIColor.white
        submitFoodButton.layer.cornerRadius = 5
        submitFoodButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        submitFoodButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        submitFoodButton.layer.shadowOpacity = 1.0
        submitFoodButton.layer.shadowRadius = 0.0
        submitFoodButton.layer.masksToBounds = false
        
        makePretty()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(NewFoodViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        expirationDateTextField.inputView = datePicker
        ingredientSegmentedController.selectedSegmentIndex = -1
        
    }
    
    func makePretty(){
        nameTextField.layer.borderWidth = 0
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        expirationDateTextField.text = dateFormatter.string(from: datePicker.date)
        
    }

}
