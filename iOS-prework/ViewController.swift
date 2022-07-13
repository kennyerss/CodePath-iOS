//
//  ViewController.swift
//  iOS-prework
//
//  Created by Kent Brylle Canonigo on 7/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTipPercentage: UILabel!
    @IBOutlet weak var minTipPercentage: UILabel!
    @IBOutlet weak var maxTipPercentage: UILabel!
    @IBOutlet weak var tipSliderInfo: UISlider!
    
    @IBOutlet weak var splitAmountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var testingTip: UILabel!
    
    // Initial property values of minTip and maxTip
    var minTip: Double = 0
    var maxTip: Double = 20
    
    // Create a step range for tip slider
    var step: Double = 2
    
    // Create variable for splitAmount as a Double
    var splitAmount: Double = 0
    
    // Create variable for percentageValueAmount
    var percentageValueAmount: Double = 0
    
    
    // Create variables for tip, bill, and total
    var tipAmount: Double = 0
    var tipPercentage: Double = 0
    var bill: Double = 0
    let total: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets title in Navigation Bar
        self.title = "Tip Calculator"
        
        // Sets billAmountTextField to be first responder
        billAmountTextField.becomeFirstResponder()
        
        // Sets tip slider initial min and max values
        minTipPercentage.text = String(format: "%.0f%%", minTip)
    
        maxTipPercentage.text = String(format: "%.0f%%", maxTip)
        
        // Initially display the currentTipPercentage with the minimum tip
        currentTipPercentage.text = minTipPercentage.text
    }
    
    // Functions to change the minimum and maximum values of slider
    
    func changeMin() -> Double {
        var currMin = Double(tipSliderInfo.minimumValue)
        currMin = minTip
        return currMin
    }
    
    func changeMax() -> Double {
        var currMax = Double(tipSliderInfo.maximumValue)
        currMax = maxTip
        return currMax
    }

    func calculateTip() -> Double {
        // Get the bill amount
        bill = Double(billAmountTextField.text!) ?? 0
        
        // Find the tipPercentage 
        tipPercentage = Double(percentageValueAmount) / 100
        
        tipAmount = bill * tipPercentage
        let total = bill + tipAmount
        
        return total
    }
    
    @IBAction func tipSliderPercentage(_ sender: UISlider) {
        // Chaning the slider maxmimum and min values
        tipSliderInfo.maximumValue = Float(changeMax())
        tipSliderInfo.minimumValue = Float(changeMin())
        
        // Initialize Double percentageValue to round out float
        var percentageValue: Double = Double(sender.value)
        
        // Update label when slider is sliding
        let roundedValue: Double = round (percentageValue / step) * step
        
        // Make percentageValue to roundedValue
        percentageValue = roundedValue
        
        // Update currentTipPercentage label
        currentTipPercentage.text = String(format:"%.0f%%", percentageValue)
        
        // Update the current percentage value variable
        percentageValueAmount = percentageValue
        
        // Update testing-tip label
        testingTip.text = String(percentageValueAmount)
        
        // Call calculateTip() to get our total amount
        let total = calculateTip()

        // Make sure that when splitAmount is 0, nothing changes to the totalLabel.text
        if splitAmount == 0 {
            // Update total amount
            totalLabel.text = String(format: "$%.2f", total)
        }

        // Update total amount
        totalLabel.text = String(format: "$%.2f", total / (splitAmount + 1))
        
        // Update tip text
        tipAmountLabel.text = String(format: "$%.2f", tipAmount)
        
    }
    
    @IBAction func decreaseSplitAmount(_ sender: UIButton) {
        
        // If splitAmount is already 0, then nothing shoud happen
        if splitAmount == 0 {
            splitAmount = 0
        }
    
        else {
            // Otherwise decrement splitAmount variable
            splitAmount -= 1
        }
    
        // Update splitAmount label
        splitAmountLabel.text = String(format: "%.0f", splitAmount)
        
        // Call calculateTip() to get our total amount
        let total = calculateTip()
    
        if splitAmount == 0 {
            // Update total amount
            totalLabel.text = String(format: "$%.2f", total)
        }
        
        // Otherwise, update total amount divided
        totalLabel.text = String(format: "$%.2f", total / (splitAmount + 1))
    }
    
    @IBAction func increaseSplitAmount(_ sender: UIButton) {
        
        // Increase the amount of people to split bill with
       splitAmount += 1
        
        // Update split amount label
        splitAmountLabel.text = String(format: "%.0f", splitAmount)
        
        // Call calculateTip() to get our total amount
        let total = calculateTip()
    
        if splitAmount == 0 {
            // Update total amount
            totalLabel.text = String(format: "$%.2f", total)
        }
        
        // Otherwise, update total amount divided by splitAmount
        totalLabel.text = String(format: "$%.2f", total / (splitAmount + 1))
        
    }
    
    
}

