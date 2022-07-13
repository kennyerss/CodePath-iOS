//
//  SettingsViewController.swift
//  iOS-prework
//
//  Created by Kent Brylle Canonigo on 7/11/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // Status for alert
    

    @IBOutlet weak var newMinimumTip: UITextField!
    @IBOutlet weak var newMaximumTip: UITextField!
    @IBOutlet weak var newRange: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"
        
    }
    
    var showingAlert = false
    
    @IBAction func applyChanges(_ sender: Any) {
        
        // Get instance of main controller
        let controller = storyboard?.instantiateViewController(withIdentifier: "mainVC") as! ViewController

        // Change controller property to new text field in SettingsViewController
        
        // Changing the min and max properties
        let newMin = Double(newMinimumTip.text!) ?? 0
        let newMax = Double(newMaximumTip.text!) ?? 0
        
        // Find the interval between maximum and minimum tips
        let difference: Double = newMax - newMin
        
        // New range of the min and max values
        let range = Double(newRange.text!) ?? 0
        controller.minTip = newMin
        controller.maxTip = newMax
        
        // Show alert if unequal range between the difference of intervals and range
        if (Int(difference) % Int(range)) != 0 {
            // Initialize showingAlert to true
            showingAlert = true
            if showingAlert != false{
                let alert = UIAlertController(title: "Error in interval range", message: "Difference between maximum and minimum tip has to be divisible by the range!", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated:true, completion: nil)
            }
        }
        
        // Else change the step range as needed
        controller.step = range
        
        // Animated presentation of the controller with changed minimum and maximum values
        present(controller, animated: true, completion: nil)
    }

}
