//
//  BaseViewController.swift
//  FoodShare
//
//  Created by Lazar Andonov on 1/24/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BaseViewController: UIViewController {
    
    let clientID = "4YCWUAVMPUF1MOZEORUOFDSPFADBXL5JB0NISIJEKD3W2NKI"
    let sicretSecret = "OP4JFDTMOTMNE1T4WZ5VLFERC2M23QDMHXP5Z4101WLTEE3V"
    var hotelArr : [BaseData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func getAllHotels() {
        let url = "https://api.foursquare.com/v2/venues/search?client_id=\(clientID)&client_secret=\(sicretSecret)&ll=44.8193266,20.4619653&query=hotel&v=20180124"
        let fullUrl = URL(string:url)
        Alamofire.request(fullUrl!).responseJSON { response in
            if let json = response.result.value {
                let jSON = JSON(json)["response"]["venues"].array!
                for item in jSON {
                    self.hotelArr.append(BaseData(data: item))
                }
            }
        }.resume()
    }

    

}
