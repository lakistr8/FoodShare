//
//  HomeViewController.swift
//  FoodShare
//
//  Created by Lazar Andonov on 1/24/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var cafeLbl: UILabel!
    @IBOutlet weak var resLbl: UILabel!
    @IBOutlet weak var ffLbl: UILabel!
    @IBOutlet weak var htlLbl: UILabel!
    @IBOutlet weak var locLbl: UILabel!
    
    let basearr: [BaseData] = [
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.initialize(component: "BaseCollectionView", data: basearr)
    }
    
    @IBAction func searchCafe(_sender: Any) {
        self.fetch(using: cafeLbl.text!, and: "BaseCollectionView")
    }
    
    @IBAction func searchRes(_sender: Any) {
        self.fetch(using: resLbl.text!, and: "BaseCollectionView")
    }
    
    @IBAction func searcFf(_sender: Any) {
        self.fetch(using: ffLbl.text!, and: "BaseCollectionView")
    }
    
    @IBAction func searchHtl(_sender: Any) {
        self.fetch(using: htlLbl.text!, and: "BaseCollectionView")
    }
    
    @IBAction func showLocationView (_sender: Any) {
        self.initialize(component: "MapView", data: basearr)
    }
    
}
