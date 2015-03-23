//
//  DropDownSection.swift
//  DropDownTableView
//
//  Created by shuning zhou on 2015-03-17.
//  Copyright (c) 2015 Intrahealth. All rights reserved.
//

import UIKit

class DropDownSection: NSObject {
    
    var title: String!
    var detail: String!
    var thumbNailType: ThumbNailType
    var isOpened: Bool
    
    init(title: String, detail: String, thumbNail: ThumbNailType)
    {
        self.title = title
        self.detail = detail
        self.thumbNailType = thumbNail
        self.isOpened = false
    }
    
    func dropDownRows() -> NSArray
    {
        var rows = [DropDownRow]()
        
        var row1 = DropDownRow(title: "row1", detail: "row1 detail", thumbNail: .Overdue)
        var row2 = DropDownRow(title: "row2", detail: "row2 detail", thumbNail: .Due)
        var row3 = DropDownRow(title: "row3", detail: "row3 detail", thumbNail: .Incomplete)
        var row4 = DropDownRow(title: "row4", detail: "row4 detail", thumbNail: .Completed)
        
        rows.append(row1)
        rows.append(row2)
        rows.append(row3)
        rows.append(row4)
        
        return rows
    }
}