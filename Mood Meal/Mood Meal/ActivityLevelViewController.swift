

import UIKit

class ActivityLevelViewController: UIViewController {
    
    @IBOutlet weak var activityButton1: UIButton!
    @IBOutlet weak var activityButton2: UIButton!
    @IBOutlet weak var activityButton3: UIButton!
    @IBOutlet weak var activityButton4: UIButton!
    
    @IBOutlet weak var activityLabel1: UILabel!
    @IBOutlet weak var activityLabel2: UILabel!
    @IBOutlet weak var activityLabel3: UILabel!
    @IBOutlet weak var activityLabel4: UILabel!
    
    var selectedMood: Mood?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        navigationItem.title = "Select your activity level"
    }
    
    func updateUI(){
        activityLabel1.text = meals[0].activity.name
        activityLabel2.text = meals[1].activity.name
        activityLabel3.text = meals[2].activity.name
        activityLabel4.text = meals[3].activity.name
        
        setupButton(button: activityButton1, textString: meals[0].activity.emoji)
        setupButton(button: activityButton2, textString: meals[1].activity.emoji)
        setupButton(button: activityButton3, textString: meals[2].activity.emoji)
        setupButton(button: activityButton4, textString: meals[3].activity.emoji)
    }
    
    func setupButton(button: UIButton, textString: String) {  button.setAttributedTitle(NSAttributedString(string: textString, attributes: [.font: UIFont.systemFont(ofSize: 100)]) , for: .normal)
    }
    
    
    @IBAction func secondThirdAndFourthButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ResultViewController", sender: sender)
    }
    
    
   @IBSegueAction func ActivitySegue(_ coder: NSCoder, sender: Any?) -> ResultViewController? {
        guard let button = sender as? UIButton, let selectedMood = selectedMood else {
                return nil
            }
        var index: Int = 0
        switch button {
        case activityButton1:
            index = 0
        case activityButton2:
            index = 1
        case activityButton3:
            index = 2
        case activityButton4:
            index = 3
        default:
            break
        }

        return ResultViewController(coder: coder, mood: selectedMood, activity: meals[index].activity)
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
