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
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotationOnLongPress(gesture:)))
        longPressGesture.minimumPressDuration = 1.0
        self.map.addGestureRecognizer(longPressGesture)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    @objc func addAnnotationOnLongPress(gesture: UILongPressGestureRecognizer) {
        
        if gesture.state == .ended {
            let point = gesture.location(in: self.map)
            let coordinate = self.map.convert(point, toCoordinateFrom: self.map)
            //Now use this coordinate to add annotation on map.
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            //Set title and subtitle if you want
            self.map.addAnnotation(annotation)
            UserDefaults.standard.set(annotation.coordinate.latitude, forKey: "lat")
            UserDefaults.standard.set(annotation.coordinate.longitude, forKey: "lng")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.map.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func savePin(_sender: Any) {
        self.removeFromSuperview()
        print("lat\(UserDefaults.standard.object(forKey: "lat") ?? ""), lng\(UserDefaults.standard.object(forKey: "lng") ?? "")")
    }
    
    @IBAction func close(_sender: Any) {
        self.removeFromSuperview()
        UserDefaults.standard.removeObject(forKey: "lat")
        UserDefaults.standard.removeObject(forKey: "lng")
    }
    
}
