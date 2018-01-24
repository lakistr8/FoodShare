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

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    
    let clientID = "4YCWUAVMPUF1MOZEORUOFDSPFADBXL5JB0NISIJEKD3W2NKI"
    let sicretSecret = "OP4JFDTMOTMNE1T4WZ5VLFERC2M23QDMHXP5Z4101WLTEE3V"
    var baseArr : [BaseData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func initialize(component:String, data:[BaseData]) {
        let nib = UINib(nibName: component, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! BaseComponent
        nib.frame = self.view.frame
        nib.initializer(data:data)
        self.view.addSubview(nib)
    }
    
    func fetch(using query:String, and component:String) {
        let url = "https://api.foursquare.com/v2/venues/search?client_id=\(clientID)&client_secret=\(sicretSecret)&ll=44.8193266,20.4619653&query=\(query)&v=20180124"
        let fullUrl = URL(string:url)
        Alamofire.request(fullUrl!).responseJSON { response in
            if let json = response.result.value {
                let jSON = JSON(json)["response"]["venues"].array!
                for item in jSON {
                    self.baseArr.append(BaseData(data: item))
                    self.initialize(component: component, data: self.baseArr)
                }
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
