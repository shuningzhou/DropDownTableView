//
//  DropDownThumbNailCompleted.swift
//  DropDownTableView
//
//  Created by shuning zhou on 2015-03-18.
//  Copyright (c) 2015 Intrahealth. All rights reserved.
//

import UIKit

class DropDownThumbNailCompleted : DropDownThumbNail
{
    override func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, STROKE_WIDTH)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let color = CGColorCreate(colorSpace, BLUE_COMPONENTS)
        CGContextSetFillColorWithColor(context, color)
        
        var padding = PADDING
        
        if(isLarge)
        {
            padding = STROKE_WIDTH
        }
        
        var rectangle = CGRectMake(padding, padding, rect.width - 2 * padding, rect.height - 2 * padding)

        
        CGContextFillEllipseInRect(context, rectangle)
    }
}
