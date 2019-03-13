//
//  ItemRowCell.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/12/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

class ItemRowCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 8)
    
    let nameLabel = UILabel(text: "Item Name", font: .systemFont(ofSize: 16))
    
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 16))
    
    let getButton = UIButton(title: "View")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.backgroundColor = .gray
        //imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        getButton.layer.cornerRadius = 32 / 2
        
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView,
            VerticalStackView(arrangedSubviews: [nameLabel, companyLabel], spacing: 4),
            getButton,
            
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
