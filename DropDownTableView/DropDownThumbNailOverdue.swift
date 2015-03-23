//
//  DropDownThumbNailOverdue.swift
//  DropDownTableView
//
//  Created by shuning zhou on 2015-03-18.
//  Copyright (c) 2015 Intrahealth. All rights reserved.
//

import UIKit

class DropDownThumbNailOverdue : DropDownThumbNail
{
    override func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let yellowColor = CGColorCreate(colorSpace, YELLOW_COMPONENTS)
        
        let blueColor = CGColorCreate(colorSpace, BLUE_COMPONENTS)
        
        var padding = PADDING
        
        if(isLarge)
        {
            padding = STROKE_WIDTH
        }
        
        var length = rect.width - 2 * padding
        let width = rect.width
        let height = rect.height
        
        //draw background triangle
        CGContextMoveToPoint(context, width / 2 - length / 20, padding +  length / 10)
        CGContextAddLineToPoint(context, padding + length / 20, height - padding - length / 10)
        CGContextAddQuadCurveToPoint(context, padding, height - padding, padding + length / 10, height - padding)
        CGContextAddLineToPoint(context, width - padding - length / 10, height - padding)
        CGContextAddQuadCurveToPoint(context, width - padding, height - padding, width - padding - length / 20, height - padding - length / 10)
        CGContextAddLineToPoint(context, width / 2 + length / 20, padding + length / 10)
        CGContextAddQuadCurveToPoint(context, width / 2, padding, width / 2 - length / 20, padding + length / 10)
        CGContextSetFillColorWithColor(context, yellowColor)
        CGContextFillPath(context)
        
        var top = padding + length * 0.37
        var ratio : CGFloat = 8
        
        //draw exclamation mark
        CGContextMoveToPoint(context, width / 2 - length / (2 * ratio), top + length / (2 * ratio))
        CGContextAddLineToPoint(context, width / 2 - length / (4 * ratio), top + length * 0.35)
        CGContextAddLineToPoint(context,  width / 2 + length / (4 * ratio), top + length * 0.35)
        CGContextAddLineToPoint(context, width / 2 + length / (2 * ratio), top + length / (2 * ratio))
        CGContextAddArcToPoint(context, width / 2 + length / (2 * ratio), top, width / 2 - length / (2 * ratio), top, length / (2 * ratio))
        CGContextAddArcToPoint(context, width / 2 - length / (2 * ratio), top, width / 2 - length / (2 * ratio), top + length / ratio, length / (2 * ratio))
        CGContextSetFillColorWithColor(context, blueColor)
        CGContextFillPath(context)
        
        let rectangle = CGRectMake(width / 2 - length / 20, top + length * 0.35 +  length / 20, length / 10,  length / 10)
        CGContextFillEllipseInRect(context, rectangle)
    }
}
