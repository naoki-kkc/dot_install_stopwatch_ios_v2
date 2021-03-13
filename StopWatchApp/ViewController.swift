//
//  ViewController.swift
//  StopWatchApp
//
//  Created by ginger893 on 2021/03/12.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var startTime: TimeInterval? = nil
    var timer = Timer()
    
    @objc func update(){
        if let startTime = self.startTime{
            let t: Double = Date.timeIntervalSinceReferenceDate - startTime
            let minute = Int(t / 60)
            let sec = Int(t) % 60
            let millisec = Int((t - Double(sec)) * 100)
            self.timerLabel.text = String(format: "%02d:%02d:%02d", minute, sec, millisec)
        }
    }
    @IBAction func startTimer(_ sender: Any) {
        self.startTime = Date.timeIntervalSinceReferenceDate
        self.timer = Timer.scheduledTimer(timeInterval: 0.01,
                             target: self,
                             selector: #selector(self.update),
                             userInfo: nil,
                             repeats: true)
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        self.timer.invalidate()
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        self.startTime = nil
        self.timerLabel.text = "00:00:00"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

