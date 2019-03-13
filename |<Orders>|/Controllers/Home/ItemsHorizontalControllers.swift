//
//  ItemsHorizontalControllers.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/12/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

class ItemsHorizontalController: BaseController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var itemGroup: ItemGroup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(ItemRowCell.self, forCellWithReuseIdentifier: cellId)
        
        if let layout =  collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemGroup?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemRowCell
        let item = itemGroup?.feed.results[indexPath.item]
        cell.nameLabel.text = item?.productName
        cell.companyLabel.text = item?.companyName
        cell.imageView.sd_setImage(with: URL(string: item?.imageUrl ?? ""))
        
        return cell
    }
    
    let topBottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 12
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing) / 3
        return .init(width: view.frame.width - 48, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: 16, bottom: topBottomPadding, right: 16)
    }
}
