//
//  Timer.swift
//  Collection
//
//  Created by Станислав Москальцов  on 18.07.2022.
//

import Foundation

protocol TimerModelDelegate {
    func time(timeRemaining: Int)
}

class TimerModel {
    
    var seconds: Int
    var timerIsOn = false
    var myTimer = Timer()
    var delegate: TimerModelDelegate?
    
    init(timeRemaining: Int = 1510) {
        self.seconds = timeRemaining
    }
    
    func startTimer() {
        if !timerIsOn {
            myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startTime), userInfo: nil, repeats: true)
            timerIsOn = true
        }
    }
    
    func pauseTimer() {
        if myTimer.isValid {
            myTimer.invalidate()
            timerIsOn = false
        }
    }
    
    func stopTimer() {
        if myTimer.isValid {
            myTimer.invalidate()
            seconds = 1510
            timerIsOn = false
        }
    }
    
    @objc func startTime() {
        delegate?.time(timeRemaining: seconds)
        seconds -= 1
    }
}
