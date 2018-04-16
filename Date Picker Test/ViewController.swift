
import UIKit

class ViewController: UIViewController {

    let timeSelector: Selector = #selector(ViewController.update)
    let interval = 1.0
    var count = 0
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var datepiker: UIDatePicker!
    @IBOutlet weak var time2Label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func DatePiker(_ sender: UIDatePicker) {
        let datePikerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        timeLabel.text = formatter.string(from: datePikerView.date)
    }
    
    
    @objc func update() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        time2Label.text = formatter.string(from: date as Date)
        
        if timeLabel.text == time2Label.text {
            view.backgroundColor = UIColor.purple
    
            let alertController = UIAlertController(title: "알람", message: "설정된 시간입니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            let DestructiveAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                
            }
            
            let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                
               self.view.backgroundColor = UIColor.white
                
            }
            
            alertController.addAction(DestructiveAction)
            
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
