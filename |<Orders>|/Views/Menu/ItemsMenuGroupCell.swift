//
//  ItemsMenuGroupCell.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/15/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

class ItemsMenuGroupCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Menu Categories", font: .boldSystemFont(ofSize: 24))
    let itemVerticalController = ItemVerticalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .purple
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        addSubview(itemVerticalController.view)
        itemVerticalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
