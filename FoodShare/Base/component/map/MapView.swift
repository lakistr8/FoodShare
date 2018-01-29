//
//  MapView.swift
//  FoodShare
//
//  Created by Lazar Andonov on 1/29/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapView: BaseComponent {

    @IBOutlet weak var map: MKMapView!
    
    
    
    @IBAction func close(_sender: Any) {
        self.removeFromSuperview()
    }
    
}
