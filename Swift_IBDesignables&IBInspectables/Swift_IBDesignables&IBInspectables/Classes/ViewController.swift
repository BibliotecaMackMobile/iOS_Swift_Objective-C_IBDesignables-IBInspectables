//
//  ViewController.swift
//  Swift_IBDesignables&IBInspectables
//
//  Created by Kaê Angeli Coutinho on 2/26/15.
//  Copyright (c) 2014 Kaê Angeli Coutinho. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // MARK: IBOutlets
    
    @IBOutlet weak var pieChartView: PieChartView?
    @IBOutlet weak var pieChartCurrentValueLabel: UILabel?
    @IBOutlet weak var pieChartCurrentValueSlider: UISlider?
    @IBOutlet weak var pieChartNewValueLabel: UILabel?
    @IBOutlet weak var pieChartNewValueSlider: UISlider?
    
    // MARK: UIView
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.initialize()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Auxiliary Methods
    
    func initialize()
    {
        self.pieChartView?.piePercentage = 0.0
        self.pieChartCurrentValueSlider?.value = 0.0
        self.pieChartNewValueSlider?.value = 0.0
        self.pieChartCurrentValueLabel?.text = NSString(format:"%%%d",Int(self.pieChartCurrentValueSlider!.value * 100.0))
        self.pieChartNewValueLabel?.text = NSString(format:"%%%d",Int(self.pieChartNewValueSlider!.value * 100.0))
        self.pieChartView?.updateLayerProperties()
    }
    
    // MARK: IBActions
    
    @IBAction func changePieChartCurrentValue(sender: UISlider)
    {
        self.pieChartCurrentValueLabel?.text = NSString(format:"%%%d",Int(sender.value * 100.0))
        self.pieChartView?.piePercentage = Double(sender.value * 100.0)
        self.pieChartView?.updateLayerProperties()
    }
    
    @IBAction func changePieChartNewValue(sender: UISlider)
    {
        self.pieChartNewValueLabel?.text = NSString(format:"%%%d",Int(sender.value * 100.0))
    }
    
    @IBAction func resetPieChart(sender: UIButton)
    {
        self.initialize()
    }
    
    @IBAction func animatePieChart(sender: UIButton)
    {
        self.pieChartView?.updatePiePercentage(newPiePercentage:Double(self.pieChartNewValueSlider!.value * 100.0))
        self.pieChartCurrentValueLabel?.text = NSString(format:"%%%d",Int(self.pieChartNewValueSlider!.value * 100.0))
        self.pieChartCurrentValueSlider?.value = self.pieChartNewValueSlider!.value
        self.pieChartView?.piePercentage = Double(self.pieChartNewValueSlider!.value * 100.0)
    }
}
