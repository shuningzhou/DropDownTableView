//
//  DropDownThumbNail.swift
//  DropDownTableView
//
//  Created by shuning zhou on 2015-03-18.
//  Copyright (c) 2015 Intrahealth. All rights reserved.
//

import UIKit

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

