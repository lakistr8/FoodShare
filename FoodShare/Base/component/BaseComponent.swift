//
//  BaseComponent.swift
//  FoodShare
//
//  Created by Lazar Andonov on 1/24/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit

class BaseComponent: UIView {
    
    var dataSource : [BaseData] = []
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func initializer(data: [BaseData]) {
        self.dataSource = data
    }
    
    func openController(name:String) {
        let nib = UINib(nibName: "\(name)", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! BaseComponent
        self.addSubview(nib)
    }
    
    func close() {
        self.removeFromSuperview()
    }
    

}
