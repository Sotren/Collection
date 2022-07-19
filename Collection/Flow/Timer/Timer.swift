//
//  Timer.swift
//  Collection
//
//  Created by Станислав Москальцов  on 18.07.2022.
//

import Foundation

protocol TimerModelDelegate {
    func time(timeRemaining:Int)
}

class TimerModel {
    
    var timeRemaining: Int
    var timerIsOn = false
    var myTimer = Timer()
    var delegate: TimerModelDelegate?
    
    init(timeRemaining:Int = 1500) {
        self.timeRemaining = timeRemaining
    }
    
    func startTimer() {
        if !timerIsOn{
            myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startTime), userInfo: nil, repeats: true)
            timerIsOn = true
        }
    }
    
    func pouseTimer () {
        if myTimer.isValid == true {
            myTimer.invalidate()
            timerIsOn = false
        }
        
    }
    
    func stopTimer() {
        if myTimer.isValid == true {
            myTimer.invalidate()
            timeRemaining = 1500
            timerIsOn = false
        }
    }
    
    @objc func startTime() {
        delegate?.time(timeRemaining: timeRemaining)
        timeRemaining -= 1
    }
}
