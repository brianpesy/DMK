//
//  ClothingViewController.swift
//  DMK
//
//  Created by Bridget Legaspi on 30/04/2018.
//  Copyright © 2018 Bridget Legaspi. All rights reserved.
//

import UIKit
import os.log
import Alamofire
import SwiftyJSON

class ClothingViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var id = 123
    var brand = ""
    var color = ""
    var material = ""
//    var classification = 1
//    var subclass = 8
    var status = 2
    var weather = 2
    
    //MARK: Properties
    @IBOutlet weak var clothingTitle: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var idNumber: UILabel!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var materialTextField: UITextField!
    @IBOutlet weak var statusNumber: UILabel!
    @IBOutlet weak var classificationNumber: UILabel!
    @IBOutlet weak var subclassNumber: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var segmentedClassification: UISegmentedControl!
    @IBOutlet weak var segmentedSubclass: UISegmentedControl!
    
    //    var dropClassification: UIDropDown!
    var clothing: Clothing?
    var classification: Int = 1
    var subclass: Int = 1
    var iconViaSubclass: String = "defaultPhoto"
    
    func getAPI(){
        Alamofire.request("https://guarded-falls-36394.herokuapp.com/mobileget").responseJSON { (responseData) -> Void in //Like our get request
            if((responseData.result.value) != nil) {
                let json = JSON(responseData.result.value!)
//                print(json)
                
                if (json["status"].stringValue == "success"){
                    //Do the code here.
                    for item in json["message"].arrayValue {
                        print(item)
//                        print(item["1"]["brand"].stringValue) //Works for nested now. Why did it not work: it lacks []. Presence of [] means array. Otherwise, use stringValue.
//                        print(item["1"]["status"].intValue)
                    }
                    
                }
                
//                if let resData = json["message"].arrayObject { //We can use this in order to get the data from the server.
//                    self.arrRes = resData as! [[String:AnyObject]] //Puts all the data into an array
//                    //                    print(resData)
//                }
//                print(self.arrRes[0]) //The data is in an array that we can individually access now.
//                if self.arrRes.count > 0 {
//                    //   self.tblJSON.reloadData() //error here? Unexpectedly found nil.
//                }
            }
        }
    }
    @IBAction func refreshButton(_ sender: Any) {
        print("hello!!!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        
        getAPI()
        
        // Handle the text field’s user input through delegate callbacks.
        // nameTextField.delegate = self
        brandTextField.delegate = self
        colorTextField.delegate = self
        materialTextField.delegate = self
        
        // ===================================================================================================
        // TESTING FOR DROPDOWN
        
//        dropClassification = UIDropDown(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
//        dropClassification.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
//        dropClassification.placeholder = "Select classification"
//        dropClassification.options = ["Top", "Bottom", "Dress"]
//        dropClassification.didSelect { (option, index) in
//            self.classificationNumber.text = option
//            print("You just select: \(option) at index: \(index)")
//        }
//        self.view.addSubview(dropClassification)

        // ===================================================================================================
        
        
        // Set up views if editing an existing Meal.
        if let clothing = clothing {
            navigationItem.title = clothing.brand
            clothingTitle.text = clothing.brand
            imageIcon.image = clothing.imageIcon
            idNumber.text = String(clothing.id)
            brandTextField.text = clothing.brand
            colorTextField.text = clothing.color
            materialTextField.text = clothing.material
            
//            statusNumber.text = String(clothing.status)
//            classificationNumber.text = String(clothing.classifiction)
//            subclassNumber.text = String(clothing.subclass)
            
//            switch clothing.classifiction {
//            case 1: classificationNumber.text = "Top"
//            case 2: classificationNumber.text = "Bottom"
//            case 3: classificationNumber.text = "Dress"
//            default: classificationNumber.text = String(clothing.classifiction)
//            }
            
            segmentedClassification.selectedSegmentIndex = (clothing.classifiction)-1
            
//            switch clothing.subclass {
//            case 1: subclassNumber.text = "Short Sleeves"
//            case 2: subclassNumber.text = "No sleeves"
//            case 3: subclassNumber.text = "Sweater"
//            case 4: subclassNumber.text = "Jacket"
//            case 5: subclassNumber.text = "Shorts"
//            case 6: subclassNumber.text = "Pants"
//            case 7: subclassNumber.text = "Skirt"
//            case 8: subclassNumber.text = "Dress"
//            default: subclassNumber.text = String(clothing.subclass)
//            }

            segmentedSubclass.selectedSegmentIndex = (clothing.subclass)-1
            
            switch clothing.status {
            case 1: statusNumber.text = "Out of the closet"
            case 2: statusNumber.text = "In of the closet"
            default: statusNumber.text = String(clothing.status)
            }
        }
        updateSaveButtonState()
    }
    
    //MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
//        navigationItem.title = textField.text
    }
    
    // MARK: Navigations
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddClothingMode = presentingViewController is UINavigationController
        
        if isPresentingInAddClothingMode {
            dismiss(animated: true, completion: nil)
        }
            
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        
        else {
            fatalError("The ClothingViewController is not inside a navigation controller.")
        }
    }
    
    
    // This method lets you configure a view controller before it's presented.
    // ADD FUNCTIONALITY
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        //ISSUE: it keeps updating. Maybe see if the ID is there already and then work around that one. 
        
        let imageIcon = self.imageIcon.image
        id = 123
        brand = brandTextField.text ?? ""
        color = colorTextField.text ?? ""
        material = materialTextField.text ?? ""
//        classification = 1
//        subclass = 8
        status = 2
        weather = 2
        
//        print(brand)
//        print(color)
        
        let parameters: [String: Any] = [ //This is the JSON we'll be passing over.
            "classification" : classification,
            "subclass" : subclass,
            "brand" : brand,
            "material" : material,
            "color" : color,
            "status" : 1,
            "weather" : 2
        ]
        
        Alamofire.request("https://damitan-mo-ko.herokuapp.com/mobileadd", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                  print(response) //It responds with the ID of the clothing item in question.
        }

        clothing = Clothing(brand: brand, classification: classification, subclass: subclass, color: color, id: id, material: material, status: status, weather: weather, imageIcon: imageIcon)
    }
    
    // MARK: Private Methods
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = brandTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    @IBAction func chooseClassification(_ sender: UISegmentedControl) {
        
        switch segmentedClassification.selectedSegmentIndex {
            case 0: classification = 1
            case 1: classification = 2
            case 2: classification = 3
            default: classification = 1
        }
    }
    
    @IBAction func chooseSubclass(_ sender: UISegmentedControl) {
        switch segmentedSubclass.selectedSegmentIndex {
        case 0: subclass = 1; iconViaSubclass = "shirt"
        case 1: subclass = 2; iconViaSubclass = "sleeveless"
        case 2: subclass = 3; iconViaSubclass = "jacket"
        case 3: subclass = 4; iconViaSubclass = "jacket"
        case 4: subclass = 5; iconViaSubclass = "shorts"
        case 5: subclass = 6; iconViaSubclass = "pants"
        case 6: subclass = 7; iconViaSubclass = "skirt"
        case 7: subclass = 8; iconViaSubclass = "dress"
        default: subclass = 1; iconViaSubclass = "defaultPhoto"
        }
    }
    
}
