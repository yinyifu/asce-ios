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
    
    private var desc : String?;
    func heightForCell(withText text:String)->CGFloat{
      //  return 99
        let view = textViewWithText(text: text)
        let sizeShouldFit = view.sizeThatFits(view.frame.size)
        return sizeShouldFit.height
        
    }
    func textViewWithText(text:String) -> UITextView {
        initData(text)
        return descriptionView;
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func initData(_ desc:String){
        //self.desc = desc
        descriptionView.textColor = UIColor.color(fromHexString: "#707070")
        descriptionView.text = desc
    }
}
