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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.dropDownTableViewDelegate = self
    }
    
    // MARK: - DropDownTableViewDelegate methods
    
    func dropDownTableView(tableView: UITableView, numberOfRowsInSectionWhenOpened section: Int) -> Int
    {
        return 3
    }
    
    func numberOfSections(tableView: UITableView) -> Int
    {
        return 3
    }
    
    func prepareTableView(tableView: UITableView, Section section: Int, Cell cell: DropDownTableViewCell) -> DropDownTableViewCell
    {
        cell.titleLabel.text = String(format: "Section Title %d", section)
        cell.detailLabel.text = String(format: "Section detail %d", section)
        cell.setThumbNailType(.Due, isLarge: true)
        
        return cell
    }
    
    func prepareTableView(tableView: UITableView, Section section: Int, Row row: Int, Cell cell: DropDownTableViewCell) -> DropDownTableViewCell
    {
        cell.titleLabel.text = String(format: "Section Title %d", section)
        cell.detailLabel.text = String(format: "row detail %d", row)
        cell.setThumbNailType(.Incomplete, isLarge: true)
        
        return cell
    }
    
    func selectedTableView(tableView: UITableView, Section section: Int) {
        
    }
    
    func selectedTableView(tableView: UITableView, Section section: Int, Row row: Int) {
        
    }
}
