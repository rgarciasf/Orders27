//
//  HomeHeaderCell.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/11/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

class HomeHeaderCell: UICollectionViewCell {
    
    let headerLabel = UILabel(text: "BBQ", font: .boldSystemFont(ofSize: 12))
    let titleLabel = UILabel(text: "Order BBQ Express for your party or events", font: .systemFont(ofSize: 24))
    
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        headerLabel.textColor = .blue
        imageView.backgroundColor = .red
        titleLabel.numberOfLines =  2
        
        let stackView = VerticalStackView(arrangedSubviews: [
            headerLabel,
            titleLabel,
            imageView
            ], spacing: 12)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
