//
//  NewFoodViewController.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 11/2/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import UIKit

class NewFoodViewController: UIViewController {
    
    @IBOutlet weak var foodNameTextField: UITextField!
    @IBOutlet weak var expirationDateTextField: UITextField!
    @IBOutlet weak var ingredientSegmentedController: UISegmentedControl!
    
    @IBOutlet weak var subFoodButt: UIButton!
    var upc: String?
    
    private var datePicker = UIDatePicker()
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func clearExpirationDate(_ sender: Any) {
        expirationDateTextField.text = ""
    }
    
    @IBAction func ingredientSelected(_ sender: Any) {
    }
    
    @IBAction func createNewFood(_ sender: Any) {
        EdamamAPIManager.shared.getFoodDataWithUPC(upc: upc!, name: foodNameTextField.text!, expirationDate: expirationDateTextField.text!, isIngredient: ingredientSegmentedController.selectedSegmentIndex)
        self.performSegue(withIdentifier: "FoodEnteredSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makePretty()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(NewFoodViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        expirationDateTextField.inputView = datePicker
        ingredientSegmentedController.selectedSegmentIndex = -1

        // Do any additional setup after loading the view.
    }
    func makePretty(){
        foodNameTextField.layer.borderWidth = 0
        subFoodButt.layer.cornerRadius = 5
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        expirationDateTextField.text = dateFormatter.string(from: datePicker.date)
        
    }
    
    

}
