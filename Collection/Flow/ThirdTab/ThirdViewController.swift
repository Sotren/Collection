//
//  ThirdViewController.swift
//  Collection
//
//  Created by Станислав Москальцов  on 17.06.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private let timerService = TimerModel()
    @IBOutlet weak var progressBar: CustomProgressView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerService.delegate = self
        timeLabel.text = "25:10"
        buttonState(state: true)
        progressBar.clipsToBounds = true
    }
    
    func buttonState(state: Bool) {
        pauseButton.isEnabled = state ? false : true
        stopButton.isEnabled = state ? false : true
    }
    
    override func awakeFromNib() {
        navigationItem.title = "Timer"
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        timerService.startTimer()
        buttonState(state: false)
    }
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        timerService.pauseTimer()
    }
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        timerService.stopTimer()
        timeLabel.text = "25:10"
        buttonState(state: true)
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
