//
//  EventCell.swift
//  asce-ios
//
//  Created by IOS Design Coding on 12/27/17.
//  Copyright © 2017 tutorials. All rights reserved.
//  inspired by Connfa!
//  http://connfa.com
//

import UIKit

class EventCell:UITableViewCell{
    private var isEnabled: Bool?;
    private var isFavorite: Bool?;
    
    @IBOutlet weak var rightContentView: UIView!
    @IBOutlet weak var leftContentView: UIView!
    
    
    @IBOutlet weak var rightCoverButton: UIButton!
    @IBOutlet weak var leftCoverButton: UIButton!
    
    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var speakerLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var highlightedView: UIView!
    var date:String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setCustomFonts()
        self.layoutIfNeeded()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
    }
    
    func setCustomFonts(){
        //No implementation
    }
    

    func initData(data: ScheEvent, delegate: EventScheProtocol){
        
        
    }
    //func getHeightForEvent(event:ScheEvent, isFirst: Bool)->Float{}
    
}
