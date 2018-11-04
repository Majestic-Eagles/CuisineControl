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
    
    var upc: String?
    
    private var datePicker = UIDatePicker()
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func clearExpirationDate(_ sender: Any) {
        expirationDateTextField.text = ""
    }
    
    @IBAction func createNewFood(_ sender: Any) {
        EdamamAPIManager.shared.getFoodDataWithUPC(upc: upc!, name: foodNameTextField.text!, expirationDate: expirationDateTextField.text!)
        self.performSegue(withIdentifier: "FoodEnteredSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(NewFoodViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        expirationDateTextField.inputView = datePicker

        // Do any additional setup after loading the view.
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        expirationDateTextField.text = dateFormatter.string(from: datePicker.date)
        
    }
    
    

}
