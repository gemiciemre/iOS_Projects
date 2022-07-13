//
//  ViewController.swift
//  TimerProjectApp
//
//  Created by Emre Gemici on 13.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var timer = Timer()
    var counter = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timeLabel.text="Time: \(counter) "
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerFunction(){
        
        timeLabel.text = "Time: \(counter)"
        counter -= 1
        
        if counter == 0 {
            timer.invalidate()
            timeLabel.text = "Time is Over"
        }
        
    }

    @IBAction func buttonClicked(_ sender: Any) {
        print("button Clicked")
    }
    
}

