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
    let closeBtn = UIButton(frame: CGRect(x: 10, y: 30, width: 30, height: 30))
    let detail = UINib(nibName: "DetailView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DetailView
    
    func initializer(data: [BaseData]) {
        for item in data {
            self.nameLbl.text = item.name
            self.adressLbl.text = item.address
            self.cityLbl.text = item.city
            self.stateLbl.text = item.country
            self.phone = item.phone
            self.lat = item.lat
            self.lng = item.lng
            self.bringSubview(toFront: self.btn)
        }
    }
    
    @objc func close() {
        self.screen.removeFromSuperview()
        self.detail.removeFromSuperview()
        self.closeBtn.removeFromSuperview()
    }
    
    func showDeatil() {
        detail.nameLbl.text = self.nameLbl.text
        detail.streetLbl.text = "Street \(self.adressLbl.text ?? "") \n Contact: \(self.phone ?? "")"
        detail.stateLbl.text = self.stateLbl.text
        detail.townLbl.text = self.cityLbl.text
        detail.frame = self.screen.frame
        screen.addSubview(detail)
        self.closeBtn.addTarget(self, action: #selector(close), for: .touchUpInside)
        self.closeBtn.setTitle("X", for: .normal)
        screen.addSubview(closeBtn)
        screen.makeKeyAndVisible()
    }
    
    @IBAction func btnTapp(_ sender: Any) {
        showDeatil()
    }
    
}
