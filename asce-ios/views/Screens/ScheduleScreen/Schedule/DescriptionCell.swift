//
//  DescriptionTextCell.swift
//  asce-ios
//
//  Created by IOS Design Coding on 1/5/18.
//  Copyright © 2018 tutorials. All rights reserved.
//

import UIKit

class DescriptionCell : UITableViewCell {
    
    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var descriptionCover: UIView!
    
    func heightForCell(withText text:String)->CGFloat{
        let view = textViewWithText(text: text)
        let sizeShouldFit = view.sizeThatFits(view.frame.size)
        return sizeShouldFit.height
        
    }
    func textViewWithText(text:String) -> UITextView {
        initData(text)
        return descriptionView;
    }
    func initData(_ desc:String){
        descriptionView.textColor = UIColor.color(fromHexString: "#A0A0A0")
        descriptionView.text = desc
    }
}
