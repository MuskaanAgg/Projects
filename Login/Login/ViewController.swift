

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var ForgotUserNameButton: UIButton!
    
    @IBOutlet weak var ForgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let sender = sender as? UIButton else { return }
        
        if sender == ForgotUserNameButton {
            segue.destination.navigationItem.title = "Forgot Username"
        } else if sender == ForgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        } else {
            segue.destination.navigationItem.title = usernameTextField.text
        }
        
    }

    
    @IBAction func LogInButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func ForgotUsernameButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "LoginViewToLandingViewControlllerSegue", sender: sender)
    }
    
    @IBAction func ForgotPasswordButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "LoginViewToLandingViewControlllerSegue", sender: sender)
    }
    
    
}

