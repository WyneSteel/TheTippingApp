//
//  TippedViewController.swift
//  TheTippingApp
//
//  Created by Wynelher Tagayuna on 3/17/23.
//

import UIKit

class TippedViewController: UIViewController {
    
    @IBOutlet weak var tipAmountLabelOutlet: UILabel!
    @IBOutlet weak var tipTransactionLabelOutlet: UILabel!
    
    @IBOutlet weak var recalculateButtonOutlet: UIButton!{
        didSet{// For rounded edges.
            recalculateButtonOutlet.layer.cornerRadius = 8
        }
    }
    
    var splitInfo: [String?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipAmountLabelOutlet.text = splitInfo[0] ?? "ERROR"// Show tip.
        tipTransactionLabelOutlet.text = "Split between \(splitInfo[1] ?? "ERROR") peaple, with \(String(format: "%.0f", Float(splitInfo[2]!)! * 100))% tip."
    }
    
    // Dismis segue.
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
