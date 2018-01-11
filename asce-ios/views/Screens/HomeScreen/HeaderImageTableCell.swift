//
//  headerImageTableCell.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/9/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit

class HeaderImageTableCell : UITableViewCell{
    @IBOutlet weak var contentImage: UIImageView!
    
    let images : Array<String>! = ["conference", "header2", "header3"]
    var current : Int? = nil;
    override func awakeFromNib() {
        super.awakeFromNib()
        self.current = 0
        updateImage()
    }
    
    @IBAction func leftClicked(_ sender: Any) {
        if let current = self.current{
            self.current = current - 1
            if(self.current! < 0){
                self.current! = self.images.count-1
            }
            updateImage()
        }
    }
    
    @IBAction func rightClicked(_ sender: Any) {
        if let current = self.current{
            self.current = current + 1
            if(self.current! == self.images.count){
                self.current! = 0
            }
            updateImage()
        }
    }
    func updateImage(){
        self.contentImage.image = UIImage(named: images[self.current!]);
    }
    
}
