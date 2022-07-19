//
//  ThirdViewController.swift
//  Collection
//
//  Created by Станислав Москальцов  on 17.06.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private let timerService = TimerModel()
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerService.delegate = self
        timeLabel.text = "25:00"
    }
    
    override func awakeFromNib() {
        navigationItem.title = "Timer"
    }
    
    @IBAction func PlayButtonPressed(_ sender: Any) {
        timerService.startTimer()
    }
    @IBAction func PauseButtonPressed(_ sender: Any) {
        timerService.pouseTimer()
    }
    
    @IBAction func StopButtonPressed(_ sender: Any) {
        timerService.stopTimer()
        timeLabel.text = "25:00"
    }
}
//MARK: - TimerModelDelegate
extension ThirdViewController: TimerModelDelegate {
    
    func time(timeRemaining: Int) {
        let minutesLeft = Int(timeRemaining) / 60 % 60
        let secondsLeft = Int(timeRemaining) % 60
        timeLabel.text = "\(minutesLeft):\(secondsLeft)"
        if timeRemaining <= 0 {
            timerService.stopTimer()
            timeLabel.text = "25:00"
        }
    }
}
