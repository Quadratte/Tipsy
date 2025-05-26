import UIKit

class ResultViewController: UIViewController {
  var splitSettings: String?
  var totalPerPerson: String?
  
  @IBOutlet var totalLabel: UILabel!
  @IBOutlet var settingsLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      totalLabel.text = totalPerPerson
      settingsLabel.text = splitSettings
    }
  
  @IBAction func recalculatePressed(_ sender: UIButton) {
    dismiss(animated: true)
  }
}
