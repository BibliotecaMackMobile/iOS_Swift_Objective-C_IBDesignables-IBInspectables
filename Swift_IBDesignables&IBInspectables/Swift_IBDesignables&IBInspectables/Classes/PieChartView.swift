//
//  PieChart.swift
//  Swift_IBDesignables&IBInspectables
//
//  Created by Kaê Angeli Coutinho on 2/26/15.
//  Copyright (c) 2014 Kaê Angeli Coutinho. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
class PieChartView: UIView
{
    // MARK: Properties
    
    var pieBackgroundLayer: CAShapeLayer!
    var pieLayer: CAShapeLayer!
    var pieStrokeWidth: Double = 0.0
    
    @IBInspectable
    var piePercentage: Double = 0.0
    
    @IBInspectable
    var pieBackgroundColor: UIColor = UIColor(white:0.8,alpha:1.0)
    
    @IBInspectable
    var pieColor: UIColor = UIColor.orangeColor()
    
    // MARK: Methods
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        self.pieStrokeWidth = Double(self.frame.size.width) / 2.0
        if !(self.pieBackgroundLayer != nil)
        {
            self.pieBackgroundLayer = CAShapeLayer()
            self.layer.addSublayer(self.pieBackgroundLayer)
            let circleRect = CGRectInset(self.bounds,
                                         CGFloat(self.pieStrokeWidth / 2.0),
                                         CGFloat(self.pieStrokeWidth / 2.0))
            let circlePath = UIBezierPath(ovalInRect:circleRect)
            self.pieBackgroundLayer.path = circlePath.CGPath
            self.pieBackgroundLayer.fillColor = nil
            self.pieBackgroundLayer.lineWidth = CGFloat(self.pieStrokeWidth)
            self.pieBackgroundLayer.strokeColor = self.pieBackgroundColor.CGColor
        }
        self.pieBackgroundLayer.frame = self.layer.bounds
        if !(self.pieLayer != nil)
        {
            self.pieLayer = CAShapeLayer()
            self.layer.addSublayer(self.pieLayer);
            let circleRect = CGRectInset(self.bounds,
                                         CGFloat(self.pieStrokeWidth / 2.0),
                                         CGFloat(self.pieStrokeWidth / 2.0))
            let circlePath = UIBezierPath(ovalInRect:circleRect)
            self.pieLayer.path = circlePath.CGPath
            self.pieLayer.fillColor = nil
            self.pieLayer.lineWidth = CGFloat(self.pieStrokeWidth)
            self.pieLayer.strokeColor = pieColor.CGColor
            self.pieLayer.anchorPoint = CGPointMake(0.5,0.5)
            self.pieLayer.transform = CATransform3DRotate(self.pieLayer.transform,CGFloat(-M_PI / 2.0),0.0,0.0,1.0)
        }
        self.pieLayer.frame = self.layer.bounds
        self.updateLayerProperties()
    }
    
    func updateLayerProperties()
    {
        if (self.pieLayer != nil)
        {
            self.pieLayer.strokeEnd = CGFloat(self.piePercentage / 100.0)
        }
    }
    
    func updatePiePercentage(#newPiePercentage: Double)
    {
        if (self.pieLayer != nil)
        {
            CATransaction.begin()
            var animation = CABasicAnimation(keyPath:"strokeEnd")
            animation.duration = ((newPiePercentage / 100.0) - (self.piePercentage / 100.0)) * 3.0
            animation.fromValue = self.piePercentage / 100.0
            animation.toValue = newPiePercentage / 100.0
            animation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
            CATransaction.setCompletionBlock(
            { () -> Void in
                CATransaction.begin()
                CATransaction.setValue(kCFBooleanTrue,forKey:kCATransactionDisableActions)
                self.pieLayer.strokeEnd = CGFloat(newPiePercentage / 100.0)
                CATransaction.commit()
            })
            self.pieLayer.addAnimation(animation,forKey:"animateStrokeEnd")
            CATransaction.commit()
        }
    }
}