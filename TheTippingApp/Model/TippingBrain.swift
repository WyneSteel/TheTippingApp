//
//  tippingBrain.swift
//  TheTippingApp
//
//  Created by Wynelher Tagayuna on 3/17/23.
//

import Foundation
import UIKit

struct TippingBrian{
    
    var percent: String?
    var split: String?
    var tip: String?
    
    // Change background color and get percent when selected
    mutating func tipSelected(_ sender: UIButton, _ zero: UIButton, _ ten: UIButton, _ twenty: UIButton){
        var result = ""
        if let buttonPercent = sender.titleLabel{
            if buttonPercent.text == "0%"{
                UIView.animate(withDuration: 0.2){
                    zero.backgroundColor = .systemBlue
                }
                ten.backgroundColor = .white
                twenty.backgroundColor = .white
                
                result = String(format: "%.2f", Float(0)/Float(100))
            }else if buttonPercent.text == "10%"{
                UIView.animate(withDuration: 0.2){
                    ten.backgroundColor = .systemBlue
                }
                zero.backgroundColor = .white
                twenty.backgroundColor = .white
                
                result = String(format: "%.2f", Float(10)/Float(100))
            }else if buttonPercent.text == "20%"{
                UIView.animate(withDuration: 0.2){
                    twenty.backgroundColor = .systemBlue
                }
                zero.backgroundColor = .white
                ten.backgroundColor = .white
                
                result = String(format: "%.2f", Float(20)/Float(100))
            }
        }
        percent = result
    }
    
    // Get split.
    mutating func getSplit(_ stepper: UIStepper, _ splitNumber: UILabel){
        var result = String(format: "%.0f", stepper.value)
        splitNumber.text = result
        split  = result
    }
    
    // Calculate tip.
    mutating func calculateSplit(_ bill: UITextField){
        var result = ""
        if let theBill = bill.text{
            result = String(format: "%.2f" ,Float(theBill)! * (Float(percent!)!+Float(1)) / Float(split!)!)
        }
        tip = result
    }
    
    // Resets all for the next calculation of tip.
    mutating func resetAll(_ textField: UITextField, _ splitLabel: UILabel, _ zero: UIButton, _ ten: UIButton, _ twenty: UIButton, _ stepper: UIStepper){
        textField.text?.removeAll()
        splitLabel.text = "1"
        zero.backgroundColor = .white
        ten.backgroundColor = .white
        twenty.backgroundColor = .white
        stepper.value = 1
        percent = nil
        split = nil
        tip = nil
    }
}
