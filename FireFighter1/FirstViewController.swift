//
//  FirstViewController.swift
//  FireFighter1
//
//  Created by Marco Loporcaro on 1/25/20
//  Copyright © 2020 Aneil Marathi. All rights reserved.
//

import UIKit
import UserNotifications

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var break_time: UILabel!
    
    
    @IBOutlet weak var reset_button: UIButton!
    
    @IBOutlet weak var start_button: UIButton!
    
    @IBOutlet weak var stop_button: UIButton!
    
    var test_case = 20
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return minData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(minData[row])"
    }
    var inMin = 1
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        inMin = minData[row]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        break_time.layer.cornerRadius = 20
        
        reset_button.layer.cornerRadius = 10
        start_button.layer.cornerRadius = 10
        stop_button.layer.cornerRadius = 10
        
        //need to prompt fade in and out
        //@IBAction func updateBirdTypeLabel(_ sender: UIButton) {
    
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound])
        {
             (granted, error) in
        }
        
        let break_time = UNMutableNotificationContent()
        break_time.title = "Great Job!"
        break_time.body = "Enjoy Your Break!"
        
        let study_time = UNMutableNotificationContent()
        study_time.title = "Break Is Over!"
        study_time.body = "Get Back To Work!"
        
        
        // Do any additional setup after loading the view.
        start_cycle()
        //show_fire(button_index: 4)
        self.cdMinPicker.delegate = self
        self.cdMinPicker.dataSource = self
        minData = [1, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]
        
    }
    
    
    func break_prompt(break_text: String)
    {
        if break_time.isHidden{
            break_time.isHidden = false
        }
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.break_time.alpha = 0.0
        }, completion: {
            (finished: Bool) -> Void in
            
            self.break_time.text = break_text
            
            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.break_time.alpha = 1.0
            }, completion: nil)
        })
    }
     
     // fire functions

         
         @objc func show_fire (button_index: Int) -> Bool
         {
             let button = get_button(button_index: button_index)
             if button.isHidden {
                 button.isHidden = false
                 return true
             } // else fire in location of button_index was already shown
             return false
         }
         
         func hide_fire ()
         {
             var button_index = 1
             var extinguished = false
             while button_index < 11 && !extinguished {
                let button = get_button(button_index: button_index)
                if !button.isHidden {
                    button.isHidden = true // add animation
                    extinguished = true
                } // else fire in location of button_index was already shown
                button_index += 1
             }
         }
    
//    func fight_fire()
//    {
//        var button_index = 1
//        var fire_found = false
//        while button_index < 11 && !fire_found {
//            let button = self.get_button(button_index: button_index)
//            if !button.isHidden {
//                button.pulsate()
//                fire_found = true
//            }
//            else{
//                button_index += 1;
//            }
//        }
//    }
         
     func start_cycle ()
     {
             var num_fires = 0
             while num_fires < 4 {
                 var button_index = Int.random(in: 1 ..< 10)
                 if self.show_fire(button_index: button_index) {
                     num_fires += 1
                     
                 }
                 else {
                     button_index = Int.random(in: 1 ..< 10)
                 }
             }
        //fight_fire()
     }
     
     func get_button(button_index: Int) -> UIButton{
         return self.view.viewWithTag(button_index) as! UIButton
     }
  
     
//    lazy var countDown = inMin*60
    lazy var countDown = test_case
    var cycle = 1
    
    var timer = Timer()
    
    @IBOutlet weak var countdownLbl: UILabel!
    @IBAction func startCountDown(_ sender: UIButton){
        let start_btn = get_button(button_index: 12)
        let stop_btn = get_button(button_index: 13)
        if !start_btn.isHidden && !timer.isValid {
            start_btn.isHidden = true
            stop_btn.isHidden = false
            startTime()
        }
    }
    
    @IBAction func stopCountDown(_ sender: UIButton) {
        let start_btn = get_button(button_index: 12)
        let stop_btn = get_button(button_index: 13)
        if !stop_btn.isHidden && timer.isValid {
            stop_btn.isHidden = true
            start_btn.isHidden = false
            timer.invalidate()
        }
    }
    
    @IBAction func resetCountDown(_ sender: UIButton) {
        timer.invalidate()
//        countDown = inMin*60
        countDown = test_case
        if(countDown/60 < 10){
            countdownLbl.text = "\(countDown/60):0\(countDown%60)"
        }
        else{
            countdownLbl.text = "\(countDown/60):\(countDown%60)"
        }
        
        startTime()
        timer.invalidate()
    }
    var isStudying = true
    
    @objc func countDownMethod(){
        
        if(countDown < 0){
            timer.invalidate()
            if(isStudying){
                breakTime()
            }
            else{
                studyTime()
            }
        }
        if(countDown%60 < 10){
            countdownLbl.text = "\(countDown/60):0\(countDown%60)"
        }
        else{
            countdownLbl.text = "\(countDown/60):\(countDown%60)"
        }
        countDown -= 1
    }
    @objc func startTime(){
        break_prompt(break_text: "Study")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownMethod), userInfo: nil, repeats: true)
        
    }
    @objc func studyTime(){
//        countDown = inMin*60
        countDown =  test_case
        isStudying = true
        break_prompt(break_text: "Study")
        if cycle > 4 {
            cycle = 1
            start_cycle()
        }
        startTime()
    }
    @IBOutlet weak var breakIndicator: UILabel!
    @objc func breakTime(){
        isStudying = false
        //breakIndicator.text = "break"
        break_prompt(break_text: "Break")
        hide_fire()
        cycle += 1
//        countDown = inMin*20
        countDown = test_case / 4
        startTime()
        
    }
    
    
    @IBOutlet weak var cdMinPicker: UIPickerView!
    var minData: [Int] = [Int]()
    @IBOutlet weak var cdSecPicker: UIPickerView!
    
    @IBAction func stopPicker(_ sender: Any) {

    }
    
}

