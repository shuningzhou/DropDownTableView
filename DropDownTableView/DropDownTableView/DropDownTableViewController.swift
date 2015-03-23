//
//  DropDownTableViewController.swift
//  DropDownTableView
//
//  Created by shuning zhou on 2015-03-23.
//  Copyright (c) 2015 Intrahealth. All rights reserved.
//

import UIKit

protocol DropDownTableViewDelegate
{
    func dropDownTableView(tableView: UITableView, numberOfRowsInSectionWhenOpened section: Int) -> Int
    func numberOfSections(tableView: UITableView) -> Int
    func dropDownTableView(tableView: UITableView, dropDownRowForSection section: Int) -> DropDownRow
    func dropDownTableView(tableView: UITableView, dropDownRowForSection section: Int, andRow row: Int) -> DropDownRow
}


class DropDownTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    let kCellIdentifier = "CellIdentifier"
    var tableView : UITableView!
    var dropDownTableViewDelegate : DropDownTableViewDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Grouped)
        tableView.registerClass(DropDownTableViewCell.self, forCellReuseIdentifier: kCellIdentifier)
        tableView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        tableView.delegate = self
        tableView.rowHeight = ROW_HEIGHT
        tableView.separatorStyle = .None
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let dropDownRow = dropDownTableViewDelegate!.dropDownTableView(tableView, dropDownRowForSection: section)
        
        if(dropDownRow.isOpened)
        {
            return dropDownTableViewDelegate!.dropDownTableView(tableView, numberOfRowsInSectionWhenOpened: section)
        }
        else
        {
            return 1
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        if dropDownTableViewDelegate != nil
        {
            return dropDownTableViewDelegate!.numberOfSections(tableView)
        }
        return 0;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier, forIndexPath: indexPath) as DropDownTableViewCell
        
        let section = indexPath.section
        let row = indexPath.row
        
        var dropDownRow = dropDownTableViewDelegate!.dropDownTableView(tableView, dropDownRowForSection: section)
        
        cell.isOpened = dropDownRow.isOpened
        
        if(row == 0)
        {
            cell.isSectionRow = true
            cell.titleLabel.text = dropDownRow.title
            cell.detailLabel.text = dropDownRow.detail
            cell.dropDownRow = dropDownRow
            cell.setThumbNailType(dropDownRow.thumbNailType, isLarge: true)
            let count = dropDownRow.subRows.count
            cell.expandable = count > 0
        }
        else
        {
            var subRow = dropDownRow.subRows[row - 1] as DropDownRow
            cell.isSectionRow = false
            cell.titleLabel.text = subRow.title
            cell.detailLabel.text = subRow.detail
            cell.setThumbNailType(subRow.thumbNailType, isLarge: false)
        }
        
        if(row == dropDownRow.subRows.count && dropDownRow.subRows.count > 0)
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
            var cell = tableView.cellForRowAtIndexPath(indexPath) as DropDownTableViewCell
            
            if !cell.expandable
            {
                return
            }
            
            var dropDownRow = dropDownTableViewDelegate!.dropDownTableView(tableView, dropDownRowForSection: section)
            dropDownRow.isOpened = !dropDownRow.isOpened

            cell.isOpened = dropDownRow.isOpened
            cell.setNeedsDisplay()
            
            if(dropDownRow.isOpened)
            {
                let indexPaths = NSMutableArray()
                
                for index in 1...dropDownRow.subRows.count
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
                
                for index in 1...dropDownRow.subRows.count
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

