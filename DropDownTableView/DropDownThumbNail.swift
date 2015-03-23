//
//  DropDownThumbNail.swift
//  DropDownTableView
//
//  Created by shuning zhou on 2015-03-18.
//  Copyright (c) 2015 Intrahealth. All rights reserved.
//

import UIKit

let PADDING : CGFloat = 5.0
let STROKE_WIDTH : CGFloat = 2.0
let BLUE_COMPONENTS : [CGFloat] = [8/255, 111/255, 180/255, 1.0]
let YELLOW_COMPONENTS : [CGFloat] = [255/255, 205/255, 37/255, 1.0]

class DropDownThumbNail : UIView
{
    var isLarge = false
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

