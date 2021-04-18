import Foundation

struct CalculatorBrain {
    
    var tip = 0.10
    var split = 2
    var totalBill = 0.00

    mutating func calculateTotalBill (bill:Double) {
        totalBill = (bill + (bill * tip)) / Double(split)    
    }
    
    func getAdvice() -> String {
    let formattedTip = Int(tip * 100)
      return "Split between \(split) people with \(formattedTip)% tip"
    }
    
    mutating func getTip(buttonTitle: String) {
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleNumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleNumber / 100
    }
}


