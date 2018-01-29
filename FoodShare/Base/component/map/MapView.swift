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

class MapView: BaseComponent, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
     let locationManager = CLLocationManager()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        map.delegate = self
        map.showsUserLocation = true
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.map.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func close(_sender: Any) {
        self.removeFromSuperview()
    }
    
}
