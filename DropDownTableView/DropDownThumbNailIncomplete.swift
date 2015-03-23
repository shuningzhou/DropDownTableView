//
//  DropDownThumbNailIncomplete.swift
//  DropDownTableView
//
//  Created by shuning zhou on 2015-03-18.
//  Copyright (c) 2015 Intrahealth. All rights reserved.
//

import UIKit

class DropDownThumbNailIncomplete : DropDownThumbNail
{
    override func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let color = CGColorCreate(colorSpace, BLUE_COMPONENTS)
        
        var padding = PADDING
        
        if(isLarge)
        {
            padding = STROKE_WIDTH
        }
        
        CGContextMoveToPoint(context, padding - 1, rect.height / 2)
        CGContextAddLineToPoint(context, rect.width - padding + 1, rect.height / 2)
        CGContextAddArcToPoint(context, rect.width - padding +  1, rect.height - padding + 1, padding - 1, rect.height - padding + 1, (rect.width - 2 * padding + 2) / 2)
        CGContextAddArcToPoint(context, padding - 1, rect.width - padding + 1, padding - 1, padding - 1, (rect.width - 2 * padding + 2) / 2)
        CGContextSetFillColorWithColor(context, color)
        CGContextFillPath(context)
        
        CGContextMoveToPoint(context, padding, rect.height / 2)
        CGContextAddArcToPoint(context, padding, padding, rect.width - padding, padding, (rect.width - 2 * padding) / 2)
        CGContextAddArcToPoint(context, rect.width - padding, padding, rect.width - padding, rect.height - padding, (rect.width - 2 * padding) / 2)
        CGContextSetLineWidth(context, STROKE_WIDTH)
        CGContextSetStrokeColorWithColor(context, color)
        CGContextStrokePath(context)
    }
}
