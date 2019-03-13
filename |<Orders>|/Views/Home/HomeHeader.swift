//
//  HomeHeader.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/11/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

class HomeHeader: UICollectionReusableView {
    
    let homeHeaderHorizontalController = HomeHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(homeHeaderHorizontalController.view)
        homeHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
