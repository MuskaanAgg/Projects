

import UIKit

class CurrentMoodViewController: UIViewController {

    @IBOutlet weak var moodButton1: UIButton!
    @IBOutlet weak var moodButton2: UIButton!
    @IBOutlet weak var moodButton3: UIButton!
    @IBOutlet weak var moodButton4: UIButton!
    
    @IBOutlet weak var moodLabel1: UILabel!
    @IBOutlet weak var moodLabel2: UILabel!
    @IBOutlet weak var moodLabel3: UILabel!
    @IBOutlet weak var moodLabel4: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Select your current mood"
        updateUI()
    }
    
    func updateUI(){
        setupButton(button: moodButton1, textString: meals[0].mood.emoji)
        setupButton(button: moodButton2, textString: meals[4].mood.emoji)
        setupButton(button: moodButton3, textString: meals[8].mood.emoji)
        setupButton(button: moodButton4, textString: meals[12].mood.emoji)
        
        moodLabel1.text = meals[0].mood.name
        moodLabel2.text = meals[4].mood.name
        moodLabel3.text = meals[8].mood.name
        moodLabel4.text = meals[12].mood.name
    }
    
    func setupButton(button: UIButton, textString: String) {
        button.setAttributedTitle(NSAttributedString(string: textString, attributes: [.font: UIFont.systemFont(ofSize: 100)]) , for: .normal)
    }
    
    @IBAction func currentMoodButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ActivityLevelViewController", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let activityVC = segue.destination as? ActivityLevelViewController else{
            return
        }
        
        guard let selectedButton = sender as? UIButton else{
            return
        }
        
        var index: Int = 0
        
        switch selectedButton {
            case moodButton1:
                index = 0
            case moodButton2:
                index = 4
            case moodButton3:
                index = 8
            case moodButton4:
                index = 12
            default:
                break
        }
        activityVC.selectedMood = meals[index].mood
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
