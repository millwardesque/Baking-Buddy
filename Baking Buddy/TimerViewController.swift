//
//  TimerViewController.swift
//  Baking Buddy
//
//  Created by Chris Millward on 2015-12-14.
//  Copyright © 2015 Pixel Pistol Games. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timeRemaining: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!

    var timer = NSTimer()
    var secondsRemaining = 0.0
    var hasStarted = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTimeLabel(datePicker.countDownDuration)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onStartButtonPressed(sender: UIButton) {
        if (!hasStarted) {
            startTimer()
        }
        else {
            pauseTimer()
        }
    }
    
    @IBAction func onResetButtonPressed(sender: UIButton) {
        updateTimeLabel(datePicker.countDownDuration)
    }
    
    func startTimer() {
        if (!hasStarted) {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
            
            secondsRemaining = datePicker.countDownDuration
            updateTimeLabel(secondsRemaining)
            startButton.setTitle("Pause", forState: .Normal)
            hasStarted = true
        }
    }
    
    func pauseTimer() {
        if (hasStarted) {
            timer.invalidate()
            startButton.setTitle("Start", forState: .Normal)
            hasStarted = false
        }
    }
    
    func updateTimeLabel(secondsRemaining: NSTimeInterval) {
        let (hours, minutes, seconds) = secondsToHoursMinutesSeconds(Int(secondsRemaining))
        timeRemaining.text = NSString(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds) as String
    }
    
    func updateTimer() {
        secondsRemaining -= 1.0
        if (secondsRemaining <= 0.0) {
            secondsRemaining = 0.0
            timer.invalidate()
            hasStarted = false
            // @TODO Trigger Alarm
        }
        
        updateTimeLabel(secondsRemaining)
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, seconds % 60)
    }
}
