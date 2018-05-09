//
//  LocationViewController.swift
//  DMK
//
//  Created by Brian Sy on 09/05/2018.
//  Copyright © 2018 dmk. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LocationViewController: UIViewController {

    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var countryTextField: UITextField!
    
    
    @IBAction func locationSend(_ sender: Any) {
        print(cityTextField.text)
        print(countryTextField.text)
        
        let parameters: [String: Any] = [ //This is the JSON we'll be passing over.
            "city" : cityTextField.text,
            "country" : countryTextField.text
        ]
        
        Alamofire.request("https://damitan-mo-ko.herokuapp.com/weatherget", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                print("Sent the data over... hopefully.") //It responds with the ID of the clothing item in question.
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
