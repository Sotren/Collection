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
        timeLabel.text = "25:10"
  
    }
    
    override func awakeFromNib() {
        navigationItem.title = "Timer"
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        timerService.startTimer()
    }
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        timerService.pauseTimer()
    }
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        timerService.stopTimer()
        timeLabel.text = "25:10"
    }
}
//MARK: - TimerModelDelegate
extension ThirdViewController: TimerModelDelegate {
    
    func time(timeRemaining: Int) {
        let seconds = Float(timeRemaining)
        let minutesLeft = Int(timeRemaining) / 60 % 60
        let secondsLeft = Int(timeRemaining) % 60
        progressBar.setProgress(seconds, animated: true)
        timeLabel.text = "\(minutesLeft):\(secondsLeft)"
        if timeRemaining <= 0 {
            timerService.stopTimer()
            timeLabel.text = "25:10"
        }
    }
}
