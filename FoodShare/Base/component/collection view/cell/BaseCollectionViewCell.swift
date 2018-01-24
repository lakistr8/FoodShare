//
//  BaseCollectionViewCell.swift
//  FoodShare
//
//  Created by Lazar Andonov on 1/24/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit
import SwiftyJSON

class BaseCollectionViewCell: UICollectionViewCell {
    
    var id: Int?
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var adressLbl : UILabel!
    @IBOutlet weak var cityLbl : UILabel!
    @IBOutlet weak var stateLbl : UILabel!
    
    
    func initializer(data: [BaseData]) {
        for item in data {
            self.nameLbl.text = item.name
            self.adressLbl.text = item.address
            self.cityLbl.text = item.city
            self.stateLbl.text = item.country
        }
    }
    
}
