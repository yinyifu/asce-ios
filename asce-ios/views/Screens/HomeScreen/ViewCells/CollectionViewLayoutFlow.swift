//
//  CollectionViewLayout.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/15/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit

class CollectionViewLayoutFlow : UICollectionViewFlowLayout {
    override init() {
        super.init()
        self.scrollDirection = UICollectionViewScrollDirection.horizontal
        self.itemSize = CGSize.init(width: 85, height: 85)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
