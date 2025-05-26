import UIKit

class CalculatorViewController: UIViewController {
  
  @IBOutlet var billTextField: UITextField!
  @IBOutlet var zeroPctButton: UIButton!
  @IBOutlet var tenPctButton: UIButton!
  @IBOutlet var twentyPctButton: UIButton!
  @IBOutlet var splitNumberLabel: UILabel!
  
  var tipPercent = 0.1
  var split = 2
  var totalBill = 0.0
  var billPerPerson = 0.0
  
  @IBAction func tipChanged(_ sender: UIButton) {
    
    zeroPctButton.isSelected = false
    tenPctButton.isSelected = false
    twentyPctButton.isSelected = false
    sender.isSelected = true
    
    switch sender.currentTitle {
    case "10%":
      tipPercent = 0.1
    case "20%":
      tipPercent = 0.2
    default:
      tipPercent = 0.0
    }
    
  }
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    split = Int(sender.value)
    splitNumberLabel.text = String(split)
  }
  
  @IBAction func calculatePressed(_ sender: UIButton) {
    totalBill = Double(billTextField.text!) ?? 0.0
    billPerPerson = totalBill * (1 + tipPercent) / Double(split)
  
    
    self.performSegue(withIdentifier: "goToResult", sender: self)

  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToResult" {
      let destinationVC = segue.destination as? ResultViewController
      destinationVC?.totalPerPerson = String(format: "%.1f", billPerPerson)
      destinationVC?.splitSettings = String("Split between \(split) people with \(String(format: "%.0f", tipPercent * 100))% tip")
    }
  }
}

