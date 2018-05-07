//
//  ClothingTableViewCell.swift
//  DMK
//
//  Created by Bridget Legaspi on 05/05/2018.
//  Copyright © 2018 dmk. All rights reserved.
//

import UIKit

class ClothingTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var clothBrand: UILabel!
    @IBOutlet weak var clothIcon: UIImageView!
    @IBOutlet weak var clothClassification: UILabel!
    @IBOutlet weak var clothSubclass: UILabel!
    @IBOutlet weak var clothStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
