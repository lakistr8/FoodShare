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
import CoreLocation

class BaseViewController: UIViewController, BaseViewControllerProtocol, CLLocationManagerDelegate {
    
    let clientID = "************"
    let sicretSecret = "*************"
    
    var baseArr : [BaseData] = []
    let locationManager = CLLocationManager()
    var userDefaults = UserDefaults.standard
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var bottomBar: UIView!
    @IBOutlet weak var img: UIImageView!
    let date = Date()
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        userDefaults.set(location.coordinate.latitude, forKey: "lat")
        userDefaults.set(location.coordinate.longitude, forKey: "lng")
    }
    
    func initialize(component:String, data:[BaseData]) {
        let nib = UINib(nibName: component, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! BaseComponent
        nib.frame.size.width = UIWindow(frame: UIScreen.main.bounds).frame.size.width
        nib.frame.size.height = self.container.frame.size.height
        nib.frame.origin.y = self.container.frame.origin.y
        nib.frame.origin.x = 0
        nib.initializer(data:data)
        self.view.addSubview(nib)
        self.view.bringSubview(toFront: bottomBar)
    }
    
    func clearView() {
        for view in self.view.subviews {
            if view.isKind(of: BaseComponent.self) {
                view.removeFromSuperview()
            }
        }
    }
    
    func fetch(using query:String, and component:String) {
        self.baseArr.removeAll()
        clearView()
        formatter.dateFormat = "yyyyMMdd"
        let currentday = formatter.string(from: date)
        let qStr = query.replacingOccurrences(of: " ", with: "_")
        let quearyStr = qStr.lowercased()
        self.img.image = UIImage(named: "\(query).png")
        let url = "https://api.foursquare.com/v2/venues/search?client_id=\(clientID)&client_secret=\(sicretSecret)&ll=\(userDefaults.object(forKey: "lat") ?? ""),\(userDefaults.object(forKey: "lng") ?? "")&query=\(quearyStr)&v=\(currentday)"
        let fullUrl = URL(string:url)
        print("\(fullUrl!)")
        Alamofire.request(fullUrl!).responseJSON { response in
            if let json = response.result.value {
                let jSON = JSON(json)["response"]["venues"].array!
                for item in jSON {
                    self.baseArr.append(BaseData(data: item))
                }
                self.initialize(component: component, data: self.baseArr)
            }
        }.resume()
    }
    
    func openController(name:String, storyboard:String) {
        let str = UIStoryboard(name: "\(storyboard)Storyboard", bundle: nil)
        guard let vc = str.instantiateViewController(withIdentifier: "\(name)ViewController") as? UIViewController else {
            fatalError("falied to create \(name) view controller")
        }
        self.present(vc, animated: true, completion: nil)
    }

    func close() {
        self.dismiss(animated: true, completion: nil)
    }

}
