//
//  BaseCollectionView.swift
//  FoodShare
//
//  Created by Lazar Andonov on 1/24/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit

class BaseCollectionView: BaseComponent, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.register(UINib(nibName: "BaseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BaseCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : BaseCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BaseCollectionViewCell", for: indexPath) as! BaseCollectionViewCell
        cell.initializer(data:[self.dataSource[indexPath.row]])
        return cell
    }
    

}
