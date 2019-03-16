//
//  HomeController.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/11/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import UIKit

class HomeController: BaseController, UICollectionViewDelegateFlowLayout{
    
    let headerId = "headerId"
    let cellId = "cellId"
    
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
        
        //1.-Header
        collectionView.register(HomeHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        //Section
        collectionView.register(ItemsGroupCell.self, forCellWithReuseIdentifier: cellId)
        
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
        
        fetchData()
    }
    
    var homeHeaderItems = [HomeHeaderItems]()
    var groups = [ItemGroup]()
    
    //2.-Header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HomeHeader
        header.homeHeaderHorizontalController.homeHeaderItems = self.homeHeaderItems
        header.homeHeaderHorizontalController.collectionView.reloadData()
        
        return header
    }
    
    //3.-Header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemsGroupCell
        
        let itemGroup = groups[indexPath.item]
        cell.titleLabel.text = itemGroup.feed.title
        cell.horizontalController.itemGroup = itemGroup
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    fileprivate func fetchData() {
        
        var firstGroup: ItemGroup?
        var secondGroup: ItemGroup?
        var thirdGroup: ItemGroup?
        
        //Sync Data to fetch together
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchHomeHeaderItems { (items, err) in
          print("Done with the header items")
          dispatchGroup.leave()
            if let err = err {
                print("Failed to fetch Items: ", err)
                return
            }
            //items?.forEach({print($0.name)})
            self.homeHeaderItems = items ?? []
        }
        
        dispatchGroup.enter()
        Service.shared.fetchFirstSectionItems { (itemGroup, err) in
            print("Done fetching first group")
            dispatchGroup.leave()
            firstGroup = itemGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchSecondSectionItems { (itemGroup, err) in
            print("Done fetching secong group")
            dispatchGroup.leave()
            secondGroup = itemGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchThirdSectionItems { (itemGroup, err) in
            print("Done fetching Third group")
            dispatchGroup.leave()
            thirdGroup = itemGroup
        }
        //Completion
        dispatchGroup.notify(queue: .main) {
            print("Complete your dipatch group task...")
            self.activityIndicatorView.stopAnimating()
            
            if let group = firstGroup {
                self.groups.append(group)
            }
            if let group = secondGroup {
                self.groups.append(group)
            }
            if let group = thirdGroup {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
}
