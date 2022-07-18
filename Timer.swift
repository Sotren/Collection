//
//  Timer.swift
//  Collection
//
//  Created by Станислав Москальцов  on 18.07.2022.
//

import Foundation
import UIKit

class TimerModel {
   var timeRemaining = 0
    var totalTime = 0
    var myTimer = Timer()
    static let shared = TimerModel()
    
    func startTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    func pouseTimer () {
        myTimer.invalidate()
    }
    
    func stopTimer() {
        myTimer.invalidate()
    }
    
    @objc func update() {
        guard let vc = UIStoryboard(name: "ThirdViewController", bundle: nil).instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController else
        { return }
        timeRemaining -= 1
          let completionPercentage = Int(totalTime - timeRemaining * 100)

           let minutesLeft = Int(timeRemaining) / 60 % 60
           let secondsLeft = Int(timeRemaining) % 60
        vc .TimeLabel.text = "\(minutesLeft):\(secondsLeft)"
        

    }
}
