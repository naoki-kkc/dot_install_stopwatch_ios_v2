//
//  ViewController.swift
//  StopWatchApp
//
//  Created by ginger893 on 2021/03/12.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @objc func update(){
        print(Date.timeIntervalSinceReferenceDate)
    }
    @IBAction func startTimer(_ sender: Any) {
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

