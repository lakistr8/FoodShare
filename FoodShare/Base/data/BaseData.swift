//
//  BaseData.swift
//  FoodShare
//
//  Created by Lazar Andonov on 1/24/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct BaseData {
    
    var id: String
    var name: String
    var lat : Double
    var lng: Double
    var address: String
    var city: String
    var country: String
    var phone: String
    
    init(data: JSON) {
        self.id = data["id"].stringValue
        self.name = data["name"].stringValue
        self.lat = data["location"]["lat"].doubleValue
        self.lng = data["location"]["lng"].doubleValue
        self.address = data["location"]["address"].stringValue
        self.city = data["location"]["city"].stringValue
        self.country = data["location"]["country"].stringValue
        self.phone = data["contact"]["phone"].stringValue
    }
    
}
