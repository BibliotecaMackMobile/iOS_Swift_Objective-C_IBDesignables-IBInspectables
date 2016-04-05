//
//  PieChartView.h
//  Objective-C_IBDesignables&IBInspectables
//
//  Created by Kaê Angeli Coutinho on 2/26/15.
//  Copyright (c) 2015 Kaê Angeli Coutinho. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface PieChartView : UIView

// Properties

@property (strong,nonatomic) CAShapeLayer * pieBackgroundLayer;
@property (strong,nonatomic) CAShapeLayer * pieLayer;
@property (assign,nonatomic) double pieStrokeWidth;
@property (assign,nonatomic) IBInspectable double piePercentage;
@property (strong,nonatomic) IBInspectable UIColor * pieBackgroundColor;
@property (strong,nonatomic) IBInspectable UIColor * pieColor;

// Methods

-(void)updateLayerProperties;
-(void)updatePiePercentage:(double)newPiePercentage;

@end
