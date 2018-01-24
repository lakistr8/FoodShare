//
//  BaseViewControllerProtocol.swift
//  FoodShare
//
//  Created by Lazar Andonov on 1/24/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import Foundation

protocol BaseViewControllerProtocol {
    
    func openController(name:String, storyboard:String)
    func close()
    
}
