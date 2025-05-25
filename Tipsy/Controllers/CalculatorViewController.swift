import UIKit

class CalculatorViewController: UIViewController {
  
  @IBOutlet var billTextField: UITextField!
  @IBOutlet var zeroPctButton: UIButton!
  @IBOutlet var tenPctButton: UIButton!
  @IBOutlet var twentyPctButton: UIButton!
  @IBOutlet var splitNumberLabel: UILabel!
  
  var tip: String = ""
  var split = 2
  var bill = ""
  
  @IBAction func tipChanged(_ sender: UIButton) {
    
    zeroPctButton.isSelected = false
    tenPctButton.isSelected = false
    twentyPctButton.isSelected = false
    sender.isSelected.toggle()
    tip = sender.currentTitle ?? ""
    billTextField.endEditing(true)
  }
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    split = Int(sender.value)
    splitNumberLabel.text = String(split)
  }
  
  @IBAction func calculatePressed(_ sender: UIButton) {
    
    print(tip)
    splitNumberLabel.text = String(split)
    bill = billTextField.text ?? ""
    print(bill)
    
    self.performSegue(withIdentifier: "goToResult", sender: self)

  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToResult" {
      let destinationVC = segue.destination as? ResultViewController
      destinationVC?.total = tip
    }
  }
}

