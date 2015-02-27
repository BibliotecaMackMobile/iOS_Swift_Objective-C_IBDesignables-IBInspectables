//
//  ViewController.m
//  Objective-C_IBDesignables&IBInspectables
//
//  Created by Kaê Angeli Coutinho on 2/26/15.
//  Copyright (c) 2015 Kaê Angeli Coutinho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()

@end

@implementation ViewController

@synthesize pieChartView;
@synthesize pieChartCurrentValueLabel;
@synthesize pieChartCurrentValueSlider;
@synthesize pieChartNewValueLabel;
@synthesize pieChartNewValueSlider;

#pragma mark - UIView

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self initialize];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Auxiliary Methods

-(void)initialize
{
    [[self pieChartView] setPiePercentage:0.0];
    [[self pieChartCurrentValueSlider] setValue:0.0];
    [[self pieChartNewValueSlider] setValue:0.0];
    [[self pieChartCurrentValueLabel] setText:[NSString stringWithFormat:@"%%%d",(int)([pieChartCurrentValueSlider value] * 100.0)]];
    [[self pieChartNewValueLabel] setText:[NSString stringWithFormat:@"%%%d",(int)([pieChartNewValueSlider value] * 100.0)]];
    [[self pieChartView] updateLayerProperties];
}

#pragma mark - IBActions

-(IBAction)changePieChartCurrentValue:(UISlider *)sender
{
    [[self pieChartCurrentValueLabel] setText:[NSString stringWithFormat:@"%%%d",(int)([sender value] * 100.0)]];
    [[self pieChartView] setPiePercentage:([sender value] * 100.0)];
    [[self pieChartView] updateLayerProperties];
}

-(IBAction)changePieChartNewValue:(UISlider *)sender
{
    [[self pieChartNewValueLabel] setText:[NSString stringWithFormat:@"%%%d",(int)([sender value] * 100.0)]];
}

-(IBAction)resetPieChart:(UIButton *)sender
{
    [self initialize];
}

-(IBAction)animatePieChart:(UIButton *)sender
{
    [[self pieChartView] updatePiePercentage:([[self pieChartNewValueSlider] value] * 100.0)];
    [[self pieChartCurrentValueLabel] setText:[NSString stringWithFormat:@"%%%d",(int)([[self pieChartNewValueSlider] value] * 100.0)]];
    [[self pieChartCurrentValueSlider] setValue:[[self pieChartNewValueSlider] value]];
    [[self pieChartView] setPiePercentage:(double)([[self pieChartNewValueSlider] value] * 100.0)];
}

@end