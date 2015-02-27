//
//  PieChartView.m
//  Objective-C_IBDesignables&IBInspectables
//
//  Created by Kaê Angeli Coutinho on 2/26/15.
//  Copyright (c) 2015 Kaê Angeli Coutinho. All rights reserved.
//

#import "PieChartView.h"

@interface PieChartView()

@end

@implementation PieChartView

@synthesize pieBackgroundLayer;
@synthesize pieLayer;
@synthesize pieStrokeWidth;
@synthesize piePercentage;
@synthesize pieBackgroundColor;
@synthesize pieColor;

#pragma mark - Constructors

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self setPieBackgroundLayer:[CAShapeLayer new]];
        [self setPieLayer:[CAShapeLayer new]];
        [self setPieStrokeWidth:0.0];
        [self setPiePercentage:0.0];
        [self setPieBackgroundColor:[UIColor colorWithWhite:0.8 alpha:1.0]];
        [self setPieColor:[UIColor orangeColor]];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setPieBackgroundLayer:[CAShapeLayer new]];
        [self setPieLayer:[CAShapeLayer new]];
        [self setPieStrokeWidth:0.0];
        [self setPiePercentage:0.0];
        [self setPieBackgroundColor:[UIColor colorWithWhite:0.8 alpha:1.0]];
        [self setPieColor:[UIColor orangeColor]];
    }
    return self;
}

#pragma mark - Methods

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self setPieStrokeWidth:[self frame].size.width / 2.0];
    if([self pieBackgroundLayer] != nil)
    {
        [self setPieBackgroundLayer:[CAShapeLayer new]];
        [[self layer] addSublayer:[self pieBackgroundLayer]];
        CGRect circleRect = CGRectInset([self bounds],
                                        ([self pieStrokeWidth] / 2.0),
                                        ([self pieStrokeWidth] / 2.0));
        UIBezierPath * circlePath = [UIBezierPath bezierPathWithOvalInRect:circleRect];
        [[self pieBackgroundLayer] setPath:[circlePath CGPath]];
        [[self pieBackgroundLayer] setFillColor:nil];
        [[self pieBackgroundLayer] setLineWidth:[self pieStrokeWidth]];
        [[self pieBackgroundLayer] setStrokeColor:[[self pieBackgroundColor] CGColor]];
    }
    [[self pieBackgroundLayer] setFrame:[[self layer] bounds]];
    if([self pieLayer] != nil)
    {
        [self setPieLayer:[CAShapeLayer new]];
        [[self layer] addSublayer:[self pieLayer]];
        CGRect circleRect = CGRectInset([self bounds],
                                        ([self pieStrokeWidth] / 2.0),
                                        ([self pieStrokeWidth] / 2.0));
        UIBezierPath * circlePath = [UIBezierPath bezierPathWithOvalInRect:circleRect];
        [[self pieLayer] setPath:[circlePath CGPath]];
        [[self pieLayer] setFillColor:nil];
        [[self pieLayer] setLineWidth:[self pieStrokeWidth]];
        [[self pieLayer] setStrokeColor:[[self pieColor] CGColor]];
        
        [[self pieLayer] setAnchorPoint:CGPointMake(0.5,0.5)];
        [[self pieLayer] setTransform:CATransform3DRotate([[self pieLayer] transform],(-M_PI / 2.0),0.0,0.0,1.0)];
    }
    [[self pieLayer] setFrame:[[self layer] bounds]];
    [self updateLayerProperties];
}

-(void)updateLayerProperties
{
    if([self pieLayer] != nil)
    {
        [[self pieLayer] setStrokeEnd:([self piePercentage] / 100.0)];
    }
}

-(void)updatePiePercentage:(double)newPiePercentage
{
    if([self pieLayer] != nil)
    {
        [CATransaction begin];
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        [animation setDuration:((newPiePercentage / 100.0) - ([self piePercentage] / 100.0)) * 3.0];
        [animation setFromValue:[NSNumber numberWithDouble:[self piePercentage] / 100.0]];
        [animation setToValue:[NSNumber numberWithDouble:(newPiePercentage / 100.0)]];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [CATransaction setCompletionBlock:^
        {
            [CATransaction begin];
            [CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
            [[self pieLayer] setStrokeEnd:(newPiePercentage / 100.0)];
            [CATransaction commit];
        }];
        [[self pieLayer] addAnimation:animation forKey:@"animateStrokeEnd"];
        [CATransaction commit];
    }
}

@end