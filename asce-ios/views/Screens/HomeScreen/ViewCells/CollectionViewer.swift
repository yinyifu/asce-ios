//
//  CollectionController.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/15/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit

class CollectionViewer: UICollectionView, UICollectionViewDataSource ,TableButtonDelegate{
    func buttonClicked(at path: IndexPath) {
        let vc = EventLoader.generateEventDetailViewController(self.eventsToShow[path.row])
        self.monokumaController.pushViewController(vc, animated: true)
    }
    
    private var eventsToShow : [ScheEvent]!
    private var monokumaController : UINavigationController!;
    func initData(_ events : [ScheEvent], _ vc: UINavigationController){
        self.eventsToShow = events
        self.dataSource = self
        self.monokumaController = vc;
        self.collectionViewLayout = CollectionViewLayoutFlow()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1    
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventsToShow.count > 6 ? 6 : eventsToShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let whichItem = indexPath.row
        
        let cell = self.dequeueReusableCell(withReuseIdentifier: "SmallViewCell", for: indexPath) as! SmallEventCell
        cell.initData(self.eventsToShow[whichItem], indexPath, self)
        return cell
    }
    
    
}