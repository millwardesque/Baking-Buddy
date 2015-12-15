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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTimeLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onStartButtonPressed(sender: UIButton) {
        updateTimeLabel()
        
    }
    
    @IBAction func onResetButtonPressed(sender: UIButton) {
        updateTimeLabel()
    }
    
    func updateTimeLabel() {
        let formatter = NSDateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("hh:mm:ss");
        timeRemaining.text = formatter.stringFromDate(datePicker.date);
    }
}

