
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var WeightTextField: UITextField!
    
    @IBOutlet weak var HeightTextField: UITextField!
    
    @IBOutlet weak var calculateBMI: UITextField!
    
    override func viewDidLoad() {
                
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    @IBAction func CalculateButton(_ sender: Any) {
        let weightString = WeightTextField.text ?? ""
        let weight = Double(weightString) ?? 0
        
        let heightString = HeightTextField.text ?? ""
        let height = Double(heightString) ?? 0
        
        let bmi = weight / (height * height)
        
        calculateBMI.text = String(format: "%.2f", bmi)
    }


}

