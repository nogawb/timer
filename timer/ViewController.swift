//
//  ViewController.swift
//  timer
//
//  Created by Ben Nogawa on 2/28/18.
//  Copyright © 2018 Ben Nogawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var timerLabel: UILabel!
    
    var seconds = 15
    
    var timer = Timer()
    
    var isTimerRunning = false
    var resumeTapped = false
    
    
    @IBAction func startButtonTapped(_ sender: Any) {
        runTimer()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
        } else {
            runTimer()
            self.resumeTapped = false
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        timer.invalidate()
        seconds = 60    //Here we manually enter the restarting point for the seconds, but it would be wiser to make this a variable or constant.
        timerLabel.text = "\(seconds)"
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        timerLabel.text = "\(seconds)"  //This will update the label.
        if (seconds == 0) {
            timer.invalidate()
            timerLabel.text = "Done!"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

