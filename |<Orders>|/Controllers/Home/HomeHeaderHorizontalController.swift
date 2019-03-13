//
//  HomeHeaderHorizontalController.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/11/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit
import SDWebImage


class HomeHeaderHorizontalController: BaseController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var homeHeaderItems = [HomeHeaderItems]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(HomeHeaderCell.self, forCellWithReuseIdentifier: cellId)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeHeaderItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeHeaderCell
        let items = homeHeaderItems[indexPath.item]
        cell.headerLabel.text = items.name
        cell.titleLabel.text = items.tagline
        cell.imageView.sd_setImage(with: URL(string: items.imageUrl))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
}
