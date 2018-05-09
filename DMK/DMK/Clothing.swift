//
//  Clothing.swift
//  DMK
//
//  Created by Bridget Legaspi on 05/05/2018.
//  Copyright © 2018 dmk. All rights reserved.
//

import UIKit

class Clothing {
    
    // MARK: Properties
    var brand: String
    var classifiction: Int
    var subclass: Int
    var color: String
    var id: Int
    var material: String
    var status: Int
    var weather: Int
    var imageIcon: UIImage?
    
    // MARK: Initialization
    init?(brand: String, classification: Int, subclass: Int,color: String, id: Int, material: String, status: Int, weather: Int, imageIcon: UIImage?) {
        
        // Initialization should fail if no string or negative integer
//        if brand.isEmpty || classification < 0 || color.isEmpty || id < 0 || material.isEmpty || status < 0 || weather < 0 {
//            return nil
//        }
        
        if brand.isEmpty {
            return nil
        }
        // Modify if condition above with something like this:
//        // The name must not be empty
//        guard !brand.isEmpty else {
//            return nil
//        }
//
//        // The rating must be between 0 and 5 inclusively
//        guard (rating >= 0) && (rating <= 5) else {
//            return nil
//        }
        
        // Initialize stored properties
        self.brand = brand
        self.classifiction = classification
        self.subclass = subclass
        self.color = color
        self.id = id
        self.material = material
        self.status = status
        self.weather = weather
        self.imageIcon = imageIcon
    }
}
