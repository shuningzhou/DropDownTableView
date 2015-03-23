//
//  ViewController.swift
//  DropDownTableView
//
//  Created by shuning zhou on 2015-03-17.
//  Copyright (c) 2015 Intrahealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    let kCellIdentifier = "CellIdentifier"
    var tableView : UITableView!
    var dropDownSections = [DropDownSection]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Grouped)
        tableView.registerClass(DropDownTableViewCell.self, forCellReuseIdentifier: kCellIdentifier)
        tableView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        tableView.delegate = self
        tableView.rowHeight = 50
        tableView.separatorStyle = .None
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        if(dropDownSections.count == 0)
        {
            var s1 = DropDownSection(title: "section 1", detail: "section 1d", thumbNail: .Due)
            var s2 = DropDownSection(title: "section 2", detail: "section 2d", thumbNail: .Completed)
            var s3 = DropDownSection(title: "section 3", detail: "section 3d", thumbNail: .Overdue)
            var s4 = DropDownSection(title: "section 4", detail: "section 4d", thumbNail: .Incomplete)
            
            dropDownSections.append(s1)
            dropDownSections.append(s2)
            dropDownSections.append(s3)
            dropDownSections.append(s4)
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let dropDownSection = dropDownSections[section]
        if(dropDownSection.isOpened)
        {
            return dropDownSection.dropDownRows().count + 1
        }
        else
        {
            return 1
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return dropDownSections.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier, forIndexPath: indexPath) as DropDownTableViewCell
        
        let section = indexPath.section
        let row = indexPath.row
        
        var dropDownSection = dropDownSections[section]

        cell.isOpened = dropDownSection.isOpened
        
        if(row == 0)
        {
            cell.isSectionRow = true
            cell.titleLabel.text = dropDownSection.title
            cell.detailLabel.text = dropDownSection.detail
            cell.section = dropDownSection
            cell.setThumbNailType(dropDownSection.thumbNailType, isLarge: true)
        }
        else
        {
            var dropDownRow = dropDownSection.dropDownRows()[row - 1] as DropDownRow
            cell.isSectionRow = false
            cell.titleLabel.text = dropDownRow.title
            cell.detailLabel.text = dropDownRow.detail
            cell.setThumbNailType(dropDownRow.thumbNailType, isLarge: false)
        }
        
        if(row == dropDownSection.dropDownRows().count)
        {
            cell.lastCellInSection = true
        }
        else
        {
            cell.lastCellInSection = false
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let section = indexPath.section;
        let row = indexPath.row;
        
        if(row == 0)
        {
            var dropDownSection = dropDownSections[section]
            dropDownSection.isOpened = !dropDownSection.isOpened
            var cell = tableView.cellForRowAtIndexPath(indexPath) as DropDownTableViewCell
            cell.isOpened = dropDownSection.isOpened
            cell.setNeedsDisplay()
            
            if(dropDownSection.isOpened)
            {
                let indexPaths = NSMutableArray()
                
                for index in 1...dropDownSection.dropDownRows().count
                {
                    let indexPath = NSIndexPath(forRow: index, inSection: section)
                    indexPaths.addObject(indexPath)
                }
                
                tableView.beginUpdates()
                tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Middle)
                tableView.endUpdates()
            }
            else
            {
                let indexPaths = NSMutableArray()
                
                for index in 1...dropDownSection.dropDownRows().count
                {
                    let indexPath = NSIndexPath(forRow: index, inSection: section)
                    indexPaths.addObject(indexPath)
                }
                
                tableView.beginUpdates()
                tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Middle)
                tableView.endUpdates()
            }
        }
    }
    
}

