

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var swAutorefresh: UISwitch!
    @IBOutlet weak var slTimeInterval: UISlider!
    @IBOutlet weak var ScColorScheme: UISegmentedControl!
    @IBOutlet weak var LbTimeInterval: UILabel!
    
    
    let config = configuration.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) {(Notification) in
            self.formatView()
            
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        formatView()
    }
    
    func formatView (){
        swAutorefresh.setOn(config.autorefresh, animated: false)
        slTimeInterval.setValue(Float(config.timeInterval), animated: false)
        ScColorScheme.selectedSegmentIndex = config.colorScheme
        ChangeTimeIntervalLabel(with: config.timeInterval)
    }
    
    func ChangeTimeIntervalLabel(with value: Double) {
        LbTimeInterval.text =   " Mudar após  \(Int(value))Segundos"
        
    }
    @IBAction func ChangeAutoRefresh(_ sender: UISwitch) {
        config.autorefresh = sender.isOn
    }
    @IBAction func ChangeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        ChangeTimeIntervalLabel(with: value )
        config.timeInterval = value
        
    }
    @IBAction func ChangeColorScheme(_ sender: UISegmentedControl) {
        
        config.colorScheme = sender.selectedSegmentIndex
    }
    

}
