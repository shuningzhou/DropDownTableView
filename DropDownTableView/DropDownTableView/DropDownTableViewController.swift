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
    func prepareTableView(tableView: UITableView, Section section: Int, Cell cell: DropDownTableViewCell) -> DropDownTableViewCell
    func prepareTableView(tableView: UITableView, Section section: Int, Row row: Int, Cell cell: DropDownTableViewCell) -> DropDownTableViewCell
    
    func selectedTableView(tableView: UITableView, Section section: Int)
    func selectedTableView(tableView: UITableView, Section section: Int, Row row: Int)
    func footerView(tableView: UITableView) -> UIView?;
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
        tableView.tableFooterView = dropDownTableViewDelegate!.footerView(tableView);
        self.view.addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dropDownTableViewDelegate!.dropDownTableView(tableView, numberOfRowsInSectionWhenOpened: section) + 1
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
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier, forIndexPath: indexPath) as! DropDownTableViewCell
        
        let section = indexPath.section
        let row = indexPath.row
        
        if(row == 0)
        {
            cell.isSectionRow = true
            dropDownTableViewDelegate!.prepareTableView(tableView, Section: section, Cell: cell)
            
        }
        else
        {
            cell.isSectionRow = false
            dropDownTableViewDelegate!.prepareTableView(tableView, Section: section, Row: row - 1, Cell: cell)
        }
        
        var numberOfRows = self.tableView(tableView, numberOfRowsInSection: section) - 1
        if(row == numberOfRows && row > 0)
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
            dropDownTableViewDelegate!.selectedTableView(tableView, Section: section);
        }
        else
            
        {
            dropDownTableViewDelegate!.selectedTableView(tableView, Section: section, Row: row - 1);
        }
    }
    
}

