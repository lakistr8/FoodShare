//
//  BaseCollectionView.swift
//  FoodShare
//
//  Created by Lazar Andonov on 1/24/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit

class BaseCollectionView: BaseComponent, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.register(UINib(nibName: "BaseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BaseCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.dataSource.count
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : BaseCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BaseCollectionViewCell", for: indexPath) as! BaseCollectionViewCell
//        cell.initializer(data:[self.dataSource[indexPath.row]])
        cell.initializer(data:self.dataSource)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! GridLayout
        
        let availableWidth = collectionView.bounds.size.width
        let columns = (availableWidth / 4 > 150) ? 4 : 2
        var itemTotalWidth = availableWidth - CGFloat(columns-1) * layout.minimumInteritemSpacing
        itemTotalWidth -= (layout.sectionInset.left + layout.sectionInset.right)
        
        let itemWidth = itemTotalWidth / CGFloat(columns)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    

}
