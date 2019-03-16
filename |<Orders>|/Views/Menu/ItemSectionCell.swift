//
//  ItemSectionCell.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/15/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

class ItemSectionCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 64 / 2)
    
    let nameLabel = UILabel(text: "Item Name", font: .systemFont(ofSize: 16))
    
    let getButton = UIButton(title: "View")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        imageView.backgroundColor = .gray
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView,
            nameLabel,
            ])
        
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
