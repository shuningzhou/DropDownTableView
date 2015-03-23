//
//  ViewController.swift
//  DropDownTableView
//
//  Created by shuning zhou on 2015-03-23.
//  Copyright (c) 2015 Intrahealth. All rights reserved.
//

import UIKit

class ViewController: DropDownTableViewController, DropDownTableViewDelegate
{
    var sections = [DropDownRow]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.dropDownTableViewDelegate = self
        
        var s1 = DropDownRow(title: "section 1", detail: "section 1d", thumbNail: .Due)
        var s2 = DropDownRow(title: "section 2", detail: "section 2d", thumbNail: .Completed)
        var s3 = DropDownRow(title: "section 3", detail: "section 3d", thumbNail: .Overdue)
        var s4 = DropDownRow(title: "section 4", detail: "section 4d", thumbNail: .Incomplete)
        
        s1.subRows = [
        DropDownRow(title: "row 1", detail: "row 1d", thumbNail: .Due),
        DropDownRow(title: "row 2", detail: "row 2d", thumbNail: .Completed),
        DropDownRow(title: "row 3", detail: "row 3d", thumbNail: .Overdue),
        DropDownRow(title: "row 4", detail: "row 4d", thumbNail: .Incomplete)]
        
        s3.subRows = [
            DropDownRow(title: "row 1", detail: "row 1d", thumbNail: .Due),
            DropDownRow(title: "row 2", detail: "row 2d", thumbNail: .Completed),
            DropDownRow(title: "row 3", detail: "row 3d", thumbNail: .Overdue),
            DropDownRow(title: "row 4", detail: "row 4d", thumbNail: .Incomplete)]
        
        sections.append(s1)
        sections.append(s2)
        sections.append(s3)
        sections.append(s4)
    }
    
    func dropDownTableView(tableView: UITableView, numberOfRowsInSectionWhenOpened section: Int) -> Int
    {
        var dropDownSection = sections[section] as DropDownRow
        return dropDownSection.subRows.count + 1
    }
    
    func numberOfSections(tableView: UITableView) -> Int
    {
        return sections.count
    }
    
    func dropDownTableView(tableView: UITableView, dropDownRowForSection section: Int) -> DropDownRow
    {
        return sections[section]
    }
    
    func dropDownTableView(tableView: UITableView, dropDownRowForSection section: Int, andRow row: Int) -> DropDownRow
    {
        var dropDownSection = sections[section] as DropDownRow
        var dropDownRow = dropDownSection.subRows[row]
        return dropDownRow
    }
}
