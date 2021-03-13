//
//  ViewController.swift
//  StopWatchApp
//
//  Created by ginger893 on 2021/03/12.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var startTime: TimeInterval? = nil
    var timer = Timer()
    var elapsedTime: Double = 0.0
    func setButtonEnable(startBtn: Bool, stopBtn: Bool, resetBtn: Bool){
        self.startButton.isEnabled = startBtn
        self.stopButton.isEnabled = stopBtn
        self.resetButton.isEnabled = resetBtn
    }
    
    @objc func update(){
        if let startTime = self.startTime{
            let t: Double = Date.timeIntervalSinceReferenceDate - startTime + self.elapsedTime
            let minute = Int(t / 60)
            let sec = Int(t) % 60
            let millisec = Int((t - Double(minute * 60) - Double(sec)) * 100)
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
        setButtonEnable(startBtn: false, stopBtn: true, resetBtn: false)
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        if let startTime = self.startTime{
            self.elapsedTime += Date.timeIntervalSinceReferenceDate - startTime
        }
        self.timer.invalidate()
        setButtonEnable(startBtn: true, stopBtn: false, resetBtn: true)
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        self.startTime = nil
        self.timerLabel.text = "00:00:00"
        self.elapsedTime = 0.0
        setButtonEnable(startBtn: true, stopBtn: false, resetBtn: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

