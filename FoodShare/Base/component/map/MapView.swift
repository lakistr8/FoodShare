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
    @IBOutlet weak var lbl:UILabel!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var closeBtn: UIButton!
    var locationManager = CLLocationManager()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        map.layer.masksToBounds = true
        map.layer.cornerRadius = 100
        
        lbl.layer.masksToBounds = true
        lbl.layer.cornerRadius = 20
        
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 20
        
        closeBtn.layer.masksToBounds = true
        closeBtn.layer.cornerRadius = 10
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotationOnLongPress(gesture:)))
        longPressGesture.minimumPressDuration = 1.0
        self.map.addGestureRecognizer(longPressGesture)
        
        map.delegate = self
        map.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        //Check for Location Services
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        //Zoom to user location
        let noLocation = CLLocationCoordinate2D()
        let viewRegion = MKCoordinateRegionMakeWithDistance(noLocation, 200, 200)
        map.setRegion(viewRegion, animated: false)
        
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
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
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLoction: CLLocation = locations[0]
        let latitude = userLoction.coordinate.latitude
        let longitude = userLoction.coordinate.longitude
        let latDelta: CLLocationDegrees = 0.01
        let lonDelta: CLLocationDegrees = 0.01
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        self.map.setRegion(region, animated: true)
        self.map.showsUserLocation = true
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func savePin(_sender: Any) {
        self.removeFromSuperview()
        UserDefaults.standard.set(self.map.centerCoordinate.latitude, forKey: "lat")
        UserDefaults.standard.set(self.map.centerCoordinate.longitude, forKey: "lng")
        print("lat\(UserDefaults.standard.object(forKey: "lat") ?? ""), lng\(UserDefaults.standard.object(forKey: "lng") ?? "")")
    }
    
    @IBAction func close(_sender: Any) {
        self.removeFromSuperview()
//        UserDefaults.standard.removeObject(forKey: "lat")
//        UserDefaults.standard.removeObject(forKey: "lng")
    }
    
}
