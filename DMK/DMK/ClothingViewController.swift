//
//  ClothingViewController.swift
//  DMK
//
//  Created by Bridget Legaspi on 30/04/2018.
//  Copyright © 2018 Bridget Legaspi. All rights reserved.
//

import UIKit
import os.log

class ClothingViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var idNumber: UILabel!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var materialTextField: UITextField!
    @IBOutlet weak var statusNumber: UILabel!
    @IBOutlet weak var classificationNumber: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var clothing: Clothing?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
//        nameTextField.delegate = self
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        mealNameLabel.text = textField.text
    }
    
    // MARK: Navigations
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let imageIcon = self.imageIcon.image
        let id = 123
        let brand = brandTextField.text ?? ""
        let color = colorTextField.text ?? ""
        let material = materialTextField.text ?? ""
        let classification = 1
        let status = 2
        let weather = 2
        
        clothing = Clothing(brand: brand, classification: classification, color: color, id: id, material: material, status: status, weather: weather, imageIcon: imageIcon)
    }
}
