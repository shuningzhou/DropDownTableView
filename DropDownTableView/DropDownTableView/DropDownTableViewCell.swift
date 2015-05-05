//
//  DropDownTableViewCell.swift
//  DropDownTableView
//
//  Created by shuning zhou on 2015-03-17.
//  Copyright (c) 2015 Intrahealth. All rights reserved.
//

import UIKit

enum ThumbNailType
{
    case Due
    case Completed
    case Incomplete
    case Overdue
    case None
}

class DropDownTableViewCell: UITableViewCell
{
    var isSectionRow = false
    var lastCellInSection = false
    var titleLabel: UILabel
    var detailLabel: UILabel
    var seperator: UIView
    var thumbNail: DropDownThumbNail
    var lineVertical: UIView
    var lineHorizontal: UIView
    weak var dropDownRow : DropDownRow? = nil
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        titleLabel = UILabel(frame: CGRect.nullRect)
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = TITLE_FONT
        titleLabel.textAlignment = .Left
        titleLabel.backgroundColor = UIColor.clearColor()
        
        detailLabel = UILabel(frame: CGRect.nullRect)
        detailLabel.textColor = UIColor.blackColor()
        detailLabel.font = DETAIL_FONT
        detailLabel.textAlignment = .Left
        detailLabel.backgroundColor = UIColor.clearColor()
        
        seperator = UIView(frame: CGRect.nullRect)
        seperator.backgroundColor = GREY_COLOR
        
        lineVertical = UIView(frame: CGRect.nullRect)
        lineVertical.backgroundColor = BLUE_COLOR
        
        lineHorizontal = UIView(frame: CGRect.nullRect)
        lineHorizontal.backgroundColor = BLUE_COLOR
        
        thumbNail = DropDownThumbNail(frame: CGRect.nullRect)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .None
        
        addSubview(titleLabel)
        addSubview(detailLabel)
        addSubview(seperator)
        addSubview(lineVertical)
        addSubview(lineHorizontal)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setThumbNailType(thumbNailType : ThumbNailType, isLarge: Bool)
    {
        thumbNail.removeFromSuperview()
        
        switch thumbNailType{
        case .Due:
            thumbNail = DropDownThumbNailDue(frame: CGRect.nullRect)
        case .Completed:
            thumbNail = DropDownThumbNailCompleted(frame: CGRect.nullRect)
        case .Incomplete:
            thumbNail = DropDownThumbNailIncomplete(frame: CGRect.nullRect)
        case .Overdue:
            thumbNail = DropDownThumbNailOverdue(frame: CGRect.nullRect)
        default:
            thumbNail = DropDownThumbNail(frame: CGRect.nullRect)
        }
        
        thumbNail.isLarge = isLarge
        
        addSubview(thumbNail)
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        layoutLines()
        layoutLabels()
        layoutThumbNail()
        showSeperatorIfNeeded()
    }
    
    func layoutLines()
    {
        if(isSectionRow)
        {
            lineVertical.hidden = false
            lineHorizontal.hidden = true
            lineVertical.frame = CGRect(x: (THUMBNAIL_CONTAINER_WIDTH - STROKE_WIDTH) / 2, y: bounds.size.height - 2 * PADDING + STROKE_WIDTH, width: STROKE_WIDTH, height: 8)
        }
        else if(lastCellInSection)
        {
            lineVertical.hidden = false
            lineHorizontal.hidden = false
            lineVertical.frame = CGRect(x: (THUMBNAIL_CONTAINER_WIDTH - STROKE_WIDTH) / 2, y: 0, width: STROKE_WIDTH, height: bounds.size.height / 2)
            lineHorizontal.frame = CGRect(x: (THUMBNAIL_CONTAINER_WIDTH - STROKE_WIDTH) / 2, y: bounds.size.height / 2 - 1, width: (THUMBNAIL_CONTAINER_WIDTH) / 2, height: 2)
        }
        else
        {
            lineVertical.hidden = false
            lineHorizontal.hidden = false
            lineVertical.frame = CGRect(x: (THUMBNAIL_CONTAINER_WIDTH - STROKE_WIDTH) / 2, y: 0, width: STROKE_WIDTH, height: bounds.size.height)
            lineHorizontal.frame = CGRect(x: (THUMBNAIL_CONTAINER_WIDTH - STROKE_WIDTH) / 2, y: bounds.size.height / 2 - 1, width: (THUMBNAIL_CONTAINER_WIDTH) / 2, height: 2)
        }
    }
    
    func layoutLabels()
    {
        if(isSectionRow)
        {
            titleLabel.frame = CGRect(x: THUMBNAIL_CONTAINER_WIDTH, y: PADDING, width: bounds.size.width - 2 * (THUMBNAIL_CONTAINER_WIDTH), height: ROW_HEIGHT / 2)
            detailLabel.frame = CGRect(x: THUMBNAIL_CONTAINER_WIDTH, y: PADDING + ROW_HEIGHT / 2 + 1, width: bounds.size.width - 2 * (THUMBNAIL_CONTAINER_WIDTH), height: ROW_HEIGHT / 2 - 2 * PADDING - 1)
        }
        else
        {
            titleLabel.frame = CGRect(x: 2 * (THUMBNAIL_CONTAINER_WIDTH) - 3 * PADDING, y: PADDING, width: bounds.size.width - 3 * (THUMBNAIL_CONTAINER_WIDTH), height:  ROW_HEIGHT / 2)
            detailLabel.frame = CGRect(x: 2 * (THUMBNAIL_CONTAINER_WIDTH) - 3 * PADDING, y: PADDING + ROW_HEIGHT / 2 + 1, width: bounds.size.width - 3 * (THUMBNAIL_CONTAINER_WIDTH), height: ROW_HEIGHT / 2 - 2 * PADDING - 1)
        }
    }
    
    func layoutThumbNail()
    {
        if(isSectionRow)
        {
            thumbNail.frame = CGRect(x: 2 * PADDING, y: 2 * PADDING, width: THUMBNAIL_WIDTH, height: THUMBNAIL_WIDTH)
        }
        else
        {
            thumbNail.frame = CGRect(x: THUMBNAIL_CONTAINER_WIDTH, y: 2 * PADDING, width: THUMBNAIL_WIDTH, height: THUMBNAIL_WIDTH)
        }
    }
    
    func showSeperatorIfNeeded()
    {
        if(lastCellInSection)
        {
            seperator.hidden = true
        }
        else
        {
            seperator.hidden = false
            seperator.frame = CGRect(x: THUMBNAIL_CONTAINER_WIDTH, y: bounds.size.height - 1, width: bounds.size.width - THUMBNAIL_CONTAINER_WIDTH, height: 1)
        }
    }
}