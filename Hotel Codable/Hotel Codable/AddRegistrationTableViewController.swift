
import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    
    var roomType: RoomType?
    var existingRegistration: Registration?

    
    var registration: Registration? {
        guard let roomType = roomType else { return nil }
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
    
        return Registration(firstName: firstName, lastName: lastName, emailAddress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, wifi: hasWifi, roomType: roomType)
    }

    var checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    var checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    var numberOfNights: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: checkInDatePicker.date, to: checkOutDatePicker.date)
        return components.day ?? 0
    }

    var roomCost: Int {
        guard let roomType = roomType else { return 0 }
        return roomType.price * numberOfNights
    }

    var wifiCost: Int {
        return wifiSwitch.isOn ? 10 * numberOfNights : 0
    }

    var totalCost: Int {
        return roomCost + wifiCost
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        if let registration = existingRegistration {
                firstNameTextField.text = registration.firstName
                lastNameTextField.text = registration.lastName
                emailTextField.text = registration.emailAddress
                checkInDatePicker.date = registration.checkInDate
                checkOutDatePicker.date = registration.checkOutDate
                numberOfAdultsStepper.value = Double(registration.numberOfAdults)
                numberOfChildrenStepper.value = Double(registration.numberOfChildren)
                wifiSwitch.isOn = registration.wifi
                roomType = registration.roomType
            }
        
//        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
        
        tableView.reloadSections(IndexSet(integer: 3), with: .automatic)
    }
    
    
//    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
//        let firstName = firstNameTextField.text ?? ""
//        let lastName = lastNameTextField.text ?? ""
//        let email = emailTextField.text ?? ""
//        let checkInDate = checkInDatePicker.date
//        let checkOutDate = checkOutDatePicker.date
//        let numberOfAdults = Int(numberOfAdultsStepper.value)
//        let numberOfChildren = Int(numberOfChildrenStepper.value)
//        let hasWifi = wifiSwitch.isOn
//        let roomChoice = roomType?.name ?? "Not Set"
//        
//        print("DONE TAPPED")
//        print("firstName: \(firstName)")
//        print("lastName: \(lastName)")
//        print("email: \(email)")
//        print("checkIn: \(checkInDate)")
//        print("checkOut: \(checkOutDate)")
//        print("numberOfAdults: \(numberOfAdults)")
//        print("numberOfChildren: \(numberOfChildren)")
//        print("wifi: \(hasWifi)")
//        print("roomType: \(roomChoice)")
//    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func updateDateViews(){
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)
        
        checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkOutDateLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    
    func updateNumberOfGuests(){
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let selectRoomTypeController = SelectRoomTypeTableViewController(coder: coder)
        selectRoomTypeController?.delegate = self
        selectRoomTypeController?.roomType = roomType
        
        return selectRoomTypeController
    }
    
    
    func updateRoomType(){
        if let roomType = roomType{
            roomTypeLabel.text = roomType.name
        } else{
            roomTypeLabel.text = "Not Set"
        }
    }
    
    func updateDoneButtonState(){
        doneBarButton.isEnabled = registration != nil
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateDoneButtonState()
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == false :
            return 0
        case checkOutDatePickerCellIndexPath where isCheckOutDatePickerVisible == false :
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath:
            return 190
        case checkOutDatePickerCellIndexPath:
            return 190
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath == checkInDateLabelCellIndexPath && isCheckOutDatePickerVisible == false{
            isCheckInDatePickerVisible.toggle()
        } else if indexPath == checkOutDateLabelCellIndexPath && isCheckInDatePickerVisible == false{
            isCheckOutDatePickerVisible.toggle()
        } else if indexPath == checkInDateLabelCellIndexPath || indexPath == checkOutDateLabelCellIndexPath{
            isCheckInDatePickerVisible.toggle()
            isCheckOutDatePickerVisible.toggle()
        } else{
            return
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    
}

   
