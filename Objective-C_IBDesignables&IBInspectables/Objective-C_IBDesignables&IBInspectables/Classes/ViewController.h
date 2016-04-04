//
//  ViewController.h
//  Objective-C_IBDesignables&IBInspectables
//
//  Created by Kaê Angeli Coutinho on 2/26/15.
//  Copyright (c) 2015 Kaê Angeli Coutinho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PieChartView.h"

@interface ViewController : UIViewController

// IBOutlets

@property (weak,nonatomic) IBOutlet PieChartView * pieChartView;
@property (weak,nonatomic) IBOutlet UILabel * pieChartCurrentValueLabel;
@property (weak,nonatomic) IBOutlet UISlider * pieChartCurrentValueSlider;
@property (weak,nonatomic) IBOutlet UILabel * pieChartNewValueLabel;
@property (weak,nonatomic) IBOutlet UISlider * pieChartNewValueSlider;

// IBActions

-(IBAction)changePieChartCurrentValue:(UISlider *)sender;
-(IBAction)changePieChartNewValue:(UISlider *)sender;
-(IBAction)resetPieChart:(UIButton *)sender;
-(IBAction)animatePieChart:(UIButton *)sender;

@end
