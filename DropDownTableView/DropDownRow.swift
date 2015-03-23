//
//  DropDownRow.swift
//  DropDownTableView
//
//  Created by shuning zhou on 2015-03-17.
//  Copyright (c) 2015 Intrahealth. All rights reserved.
//

import UIKit

class DropDownRow: NSObject {
    
    var title: String!
    var detail: String!
    var thumbNailType: ThumbNailType
    var isOpened: Bool
    var subRows = [DropDownRow]()
    
    init(title: String, detail: String, thumbNail: ThumbNailType)
    {
        self.title = title
        self.detail = detail
        self.thumbNailType = thumbNail
        self.isOpened = false
    }
}