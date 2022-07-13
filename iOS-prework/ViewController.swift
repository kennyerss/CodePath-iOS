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
    
    // Create text property from settings page
    var minTip: Double = 0
    var maxTip: Double = 20
    
//    var minimumValue: Float = minTip
    
//    var minTip = tipSliderInfo.minimumValue
//    var maxTip = tipSliderInfo.maximumValue
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets title in Navigation Bar
        self.title = "Tip Calculator"
        
        // Sets billAmountTextField to be first responder
        billAmountTextField.becomeFirstResponder()
        
        // Sets tip slider initial min and max values
        minTipPercentage.text = String(format: "%.0f%%", minTip)
    
        maxTipPercentage.text = String(format: "%.0f%%", maxTip)
        
        currentTipPercentage.text = minTipPercentage.text
    }
    
    
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
    
    
    // Create a step range for tip slider
    var step: Double = 5
    
    // Create variable for splitAmount as a Double
    var splitAmount: Double = 0
    
    // Create variable for percentageValueAmount
    var percentageValueAmount: Double = 0
    
    @IBAction func tipSliderPercentage(_ sender: UISlider) {
        tipSliderInfo.maximumValue = Float(changeMax())
        tipSliderInfo.minimumValue = Float(changeMin())
//        tipSliderInfo.minimumValue: Double = minTip
//        tipSliderInfo.maximumValue: Double = maxTip
        
        var percentageValue: Double = Double(sender.value)
        
        // Update label when slider is sliding
        let roundedValue: Double = round (percentageValue / step) * step
        
        // Make percentageValue to roundedValue
        percentageValue = roundedValue
        
        // Update currentTipPercentage label
        currentTipPercentage.text = String(format:"%.0f%%", percentageValue)
        
        percentageValueAmount = percentageValue
        
        // Update testing-tip label
        testingTip.text = String(percentageValueAmount)
        
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let percentage = percentageValueAmount / 100
        let tip = bill * percentage
        let total = bill + tip
        
        if splitAmount == 0 {
            // Update total amount
            totalLabel.text = String(format: "$%.2f", total)
        }

        // Update total amount
        totalLabel.text = String(format: "$%.2f", total / (splitAmount + 1))
        
        // Update tip text
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
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
        
        // Get bill from billAmountTextField
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get the total tip amount
        let percentage = percentageValueAmount / 100
        let tip = bill * percentage
        let total = bill + tip
    
        if splitAmount == 0 {
            // Update total amount
            totalLabel.text = String(format: "$%.2f", total)
        }
        
        // Update total amount
        totalLabel.text = String(format: "$%.2f", total / (splitAmount + 1))
    }
    
    @IBAction func increaseSplitAmount(_ sender: UIButton) {
        
        // Increase the amount of people to split bill with
       splitAmount += 1
        
        // Update split amount label
        splitAmountLabel.text = String(format: "%.0f", splitAmount)
        
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let percentage = percentageValueAmount / 100
        let tip = bill * percentage
        let total = bill + tip
        
        if splitAmount == 0 {
            // Update total amount
            totalLabel.text = String(format: "$%.2f", total)
        }

        // Update total amount
        totalLabel.text = String(format: "$%.2f", total / (splitAmount + 1))
        

    }
    
    
}

