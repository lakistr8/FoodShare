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
    
    let screen = UIWindow(frame: UIScreen.main.bounds)
    var id: Int?
    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var adressLbl : UILabel!
    @IBOutlet weak var cityLbl : UILabel!
    @IBOutlet weak var stateLbl : UILabel!
    @IBOutlet weak var btn: UIButton!
    var phone : String?
    var lat : Double?
    var lng : Double?
    
    func initializer(data: [BaseData]) {
        for item in data {
            self.nameLbl.text = item.name
            self.adressLbl.text = item.address
            self.cityLbl.text = item.city
            self.stateLbl.text = item.country
            self.phone = item.phone
            self.lat = item.lat
            self.lng = item.lng
        }
    }
    
    func showDeatil() {
        let detail = UINib(nibName: "DetailView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DetailView
        detail.nameLbl.text = self.nameLbl.text
        detail.streetLbl.text = "Street \(self.adressLbl.text ?? "") \n Contact: \(self.phone ?? "")"
        detail.stateLbl.text = self.stateLbl.text
        detail.townLbl.text = self.cityLbl.text
        detail.frame = screen.frame
        screen.addSubview(detail)
        screen.makeKeyAndVisible()
    }
    
    @IBAction func btnTapp(_ sender: Any) {
        showDeatil()
    }
    
}
