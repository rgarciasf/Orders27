//
//  BaseController.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/11/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

class BaseController: UICollectionViewController {
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
