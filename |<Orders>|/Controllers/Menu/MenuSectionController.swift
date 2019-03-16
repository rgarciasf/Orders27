//
//  MenuController.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/11/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

class MenuSectionController: BaseController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var groups = [ItemMenu]()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(ItemsMenuGroupCell.self, forCellWithReuseIdentifier: cellId)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
        
        fetchMenuData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemsMenuGroupCell
        
        let itemMenu = groups[indexPath.item]
        cell.titleLabel.text = itemMenu.menu.title
        cell.itemVerticalController.itemMenu = itemMenu
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
        
    }
    
    fileprivate func fetchMenuData(){
        
        var firstGroup: ItemMenu?
        var secondGroup: ItemMenu?
        var thirdGroup: ItemMenu?
        
        //Sync data to fetch together
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchFirstMenuItems { (itemMenu, err) in
            print("Done Featcing menu items 1")
            dispatchGroup.leave()
            firstGroup = itemMenu
            //print(firstGroup?.menu.results)
        }
        
        dispatchGroup.enter()
        Service.shared.fetchSecondMenuItems { (itemMenu, err) in
            print("Done Fetching menu items 2")
            dispatchGroup.leave()
            secondGroup = itemMenu
        }
        
        //Completion
        dispatchGroup.notify(queue: .main) {
            print("Complete Dispatch Group task for menu items")
            self.activityIndicatorView.stopAnimating()
            if let group = firstGroup {
                self.groups.append(group)
            }
            if let group = secondGroup {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
        
    }
    
}
