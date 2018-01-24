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
    
    init(data: JSON) {
        self.id = data["id"].string!
        self.name = data["name"].string!
        self.lat = data["location"]["lat"].double!
        self.lng = data["location"]["lng"].double!
        self.address = data["location"]["address"].string!
        self.city = data["location"]["city"].string!
        self.country = data["location"]["country"].string!
    }
    
}
