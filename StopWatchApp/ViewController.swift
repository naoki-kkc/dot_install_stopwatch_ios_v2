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
    
    @objc func update(){
        if let startTime = self.startTime{
            let t: Double = Date.timeIntervalSinceReferenceDate - startTime
            print(t)
        }
    }
    @IBAction func startTimer(_ sender: Any) {
        self.startTime = Date.timeIntervalSinceReferenceDate
        Timer.scheduledTimer(timeInterval: 0.01,
                             target: self,
                             selector: #selector(self.update),
                             userInfo: nil,
                             repeats: true)
    }
    @IBAction func stopTimer(_ sender: Any) {
    }
    @IBAction func resetTimer(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

