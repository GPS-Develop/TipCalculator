import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!

    var tip = 0.10
    var split = 2
    var totalBill = 0.00
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        
        let buttonTitleNumber = Double(buttonTitleMinusPercentSign)!
        
        tip = buttonTitleNumber / 100
        billTextField.endEditing(true)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        split = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(tip)
        print(split)
        let bill = Double(billTextField.text ?? "0.00") ?? 0.00
        
        totalBill = (bill + (bill * tip)) / Double(split)
        
        print(String(format: "%.2f", totalBill))
        
        performSegue(withIdentifier: "resultsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "resultsSegue" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalBill = String(format: "%.2f", totalBill)
            let formattedTip = Int(tip * 100)
            destinationVC.advice = "Split between \(split) people with \(formattedTip)% tip"
        }
    }
}

