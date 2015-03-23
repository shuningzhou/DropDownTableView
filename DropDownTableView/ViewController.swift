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
        
        // make 4 dummy sections
        var section1 = DropDownRow(title: "section 1", detail: "section 1d", thumbNail: .Due)
        var section2 = DropDownRow(title: "section 2", detail: "section 2d", thumbNail: .Completed)
        var section3 = DropDownRow(title: "section 3", detail: "section 3d", thumbNail: .Overdue)
        var section4 = DropDownRow(title: "section 4", detail: "section 4d", thumbNail: .Incomplete)
        
        section1.subRows = [
            DropDownRow(title: "row 1", detail: "row 1d", thumbNail: .Due),
            DropDownRow(title: "row 2", detail: "row 2d", thumbNail: .Completed),
            DropDownRow(title: "row 3", detail: "row 3d", thumbNail: .Overdue),
            DropDownRow(title: "row 4", detail: "row 4d", thumbNail: .Incomplete)]
        
        section3.subRows = [
            DropDownRow(title: "row 1", detail: "row 1d", thumbNail: .Due),
            DropDownRow(title: "row 2", detail: "row 2d", thumbNail: .Completed),
            DropDownRow(title: "row 3", detail: "row 3d", thumbNail: .Overdue),
            DropDownRow(title: "row 4", detail: "row 4d", thumbNail: .Incomplete)]
        
        sections.append(section1)
        sections.append(section2)
        sections.append(section3)
        sections.append(section4)
    }
    
    // MARK: - DropDownTableViewDelegate methods
    
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
