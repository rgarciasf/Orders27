//
//  ItemsGroupCell.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/12/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

class ItemsGroupCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Top Groups", font: .boldSystemFont(ofSize: 24))
    
    let horizontalController = ItemsHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .green
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor ,bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
