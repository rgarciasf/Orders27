//
//  ItemVerticalController.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/15/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

class ItemVerticalController: BaseController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellID"
    
    var itemMenu: ItemMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white

        collectionView.register(ItemSectionCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemSectionCell
        let item = itemMenu?.menu.results[indexPath.item]
        cell.nameLabel.text = item?.productName
        cell.imageView.sd_setImage(with: URL(string: item?.imageUrl ?? ""))
        return cell
    }
    
    let topBottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 4
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing) / 4
        return .init(width: view.frame.width - 24, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: 8, bottom: topBottomPadding, right: 8)
    }
    
}
