//
//  FirstViewController.swift
//  FireFighter1
//
//  Created by Marco Loporcaro on 1/25/20.
//  Copyright © 2020 Aneil Marathi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var countDown = 1500
    var timer = Timer()
    
    @IBOutlet weak var countdownLbl: UILabel!
    @IBAction func startCountDown(_ sender: UIButton){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownMethod), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopCountDown(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func resetCountDown(_ sender: UIButton) {
        timer.invalidate()
        countDown = 1500
        let cdMins = countDown/60
        let cdSecs = countDown%60
        
        if(cdSecs < 10){
            countdownLbl.text = "\(cdMins):0\(cdSecs)"
        }
        else{
            countdownLbl.text = "\(cdMins):\(cdSecs)"
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownMethod), userInfo: nil, repeats: true)
        timer.invalidate()
    }
    @objc func countDownMethod(){
        var cdMins = 0
        var cdSecs = 0
        countDown -= 1
        cdMins = countDown/60
        cdSecs = countDown%60
        
        if(cdSecs < 10){
            countdownLbl.text = "\(cdMins):0\(cdSecs)"
        }
        else{
            countdownLbl.text = "\(cdMins):\(cdSecs)"
        }

    }
    
}

