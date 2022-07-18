//
//  ThirdViewController.swift
//  Collection
//
//  Created by Станислав Москальцов  on 17.06.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var TimeLabel: UILabel!
    var timerDisplay = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func awakeFromNib() {
        navigationItem.title = "Blue"
    }
    
    @IBAction func PlayButtonPressed(_ sender: Any) {
        TimerModel.shared.startTimer()
    }
    @IBAction func PauseButtonPressed(_ sender: Any) {
        TimerModel.shared.pouseTimer()
    }
    
    @IBAction func StopButtonPressed(_ sender: Any) {
        TimerModel.shared.stopTimer()
    }
    
   
}
