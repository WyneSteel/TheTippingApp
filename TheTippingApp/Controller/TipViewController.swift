//
//  ViewController.swift
//  TheTippingApp
//
//  Created by Wynelher Tagayuna on 3/16/23.
//

import UIKit

class TipViewController: UIViewController{

    @IBOutlet weak var billLabelOutlet: UITextField!
    @IBOutlet weak var splitLabelOutlet: UILabel!
    
    @IBOutlet weak var zeroPercentButtonOutlet: UIButton!{
        didSet{// For rounded edges.
            zeroPercentButtonOutlet.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var tenPercentButtonOutlet: UIButton!{
        didSet{// For rounded edges.
            tenPercentButtonOutlet.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var twentyPercentButtonOutlet: UIButton!{
        didSet{// For rounded edges.
            twentyPercentButtonOutlet.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var calculateButtonOutlet: UIButton!{
        didSet{// For rounded edges.
            calculateButtonOutlet.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var stepperOutlet: UIStepper!{
        didSet{// For rounded edges.
            stepperOutlet.layer.cornerRadius = 8
        }
    }
    
    var tippingBrain = TippingBrian()// Object
    
    var splitInfo: [String?] = [nil,nil,nil]// Store the copy of the tip, split, and percent.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.billLabelOutlet.delegate = self
    }
    
    @IBAction func tipButtons(_ sender: UIButton) {
        // Change background color and get percent when selected
        tippingBrain.tipSelected(sender, zeroPercentButtonOutlet, tenPercentButtonOutlet, twentyPercentButtonOutlet)
    }
    
    @IBAction func splitStepper(_ sender: UIStepper) {
        // Get split.
        tippingBrain.getSplit(sender, splitLabelOutlet)
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        // Calculate tip.
        tippingBrain.calculateSplit(billLabelOutlet)
        
        // Only perform segue when the tip has been calculated.
        if tippingBrain.tip != nil{
            splitInfo[0] = tippingBrain.tip
            splitInfo[1] = tippingBrain.split
            splitInfo[2] = tippingBrain.percent
            
            // Resets all for the next calculation of tip.
            tippingBrain.resetAll(billLabelOutlet, splitLabelOutlet, zeroPercentButtonOutlet, tenPercentButtonOutlet, twentyPercentButtonOutlet, stepperOutlet)
            performSegue(withIdentifier: "goToTippedVC", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTippedVC"{
            let destinationVC = segue.destination as! TippedViewController
            destinationVC.splitInfo = splitInfo
        }
    }
}

extension TipViewController: UITextFieldDelegate{// Dismiss number pad
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return billLabelOutlet.resignFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

