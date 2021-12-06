//
//  ViewController.swift
//  Prework
//
//  Created by Alan Kuo on 12/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPerc: UILabel!
    
    
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var splitControl: UISegmentedControl!
    
    @IBOutlet weak var darkToggle: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
    }
    //override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       //self.view.endEditing(true)
    //}
    
    @IBAction func inputBill(_ sender: Any) {

        // Calculate tip amount whenever user changes the value of the bill
        calcTip()
    }
    
    @IBAction func calculateTip(_ sender: Any) {

        // Set tip percentages
        let tipPercentages = [0.15, 0.18, 0.2]
        
        // set the value of the tip slider equal to the preset value
        tipSlider.setValue(Float(lroundf(Float(100 * tipPercentages[tipControl.selectedSegmentIndex]))), animated: true)
        // Update the tip percentage displayed
        tipPerc.text = String(format: "%.0f%%", tipSlider.value)
        // Calculate the tip
        calcTip()
    }
    
    @IBAction func changeSlider(_ sender: UISlider) {
        // Adjust slider behavior so that it stops on integer values
        sender.setValue(Float(lroundf(sender.value)), animated: true)
        // Adjust tip percentage displayed
        tipPerc.text = String(format: "%.0f%%", sender.value)
        // Calculate the tip
        calcTip()
    }
    
    func calcTip() {
        // Get the tip percentage
        let tipPercent = (Double(String(tipPerc.text!).dropLast()) ?? 0) / 100
        // Get the bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        // Calculate the tip, total, and split bill
        let tip = tipPercent * bill
        let total = bill + tip
        let splitBill = total / Double(splitControl.selectedSegmentIndex + 1)
        // Update labels
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        splitLabel.text = String(format:"$%.2f", splitBill)
    }
    
    
    @IBAction func changeSplit(_ sender: Any) {
        // Recalculate tip if user changes how bill is split
        calcTip()
    }
    
    
    @IBAction func darkMode(_ sender: UISegmentedControl) {
        // If light mode segment selected, set window to light mode
        if sender.selectedSegmentIndex == 0 {
            view.window?.overrideUserInterfaceStyle = .light
            print("light mode")
        }
        // Otherwise, set window to dark mode
        else {
            view.window?.overrideUserInterfaceStyle = .dark
            print("dark mode")
        }
    }
}

