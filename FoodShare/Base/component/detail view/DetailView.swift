//
//  DetailView.swift
//  FoodShare
//
//  Created by Lazar Andonov on 1/31/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit
import MapKit

class DetailView: BaseComponent {

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var streetLbl: UILabel!
    @IBOutlet weak var townLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet var lbls : [UILabel]!
    
    override func layoutSubviews() {
         super.layoutSubviews()
        layout()
    }
    
    
    func layout() {
        for item in lbls {
            item.layer.masksToBounds = true
            item.layer.cornerRadius = 10
            item.backgroundColor = UIColor.black.withAlphaComponent(0.9)
            item.textColor = UIColor.white
        }
        map.layer.masksToBounds = true
        map.layer.cornerRadius = map.frame.height / 2
        map.layer.shadowRadius = 10
    }
    

}
