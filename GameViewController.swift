//
//  ViewController.swift
//  FireFighter
//
//  Created by Canyon Sembera on 1/25/20.
//  Copyright © 2020 TAMUHACK. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        start_cycle()
        // Do any additional setup after loading the view.
    }
    
    
//    @IBAction func fire(_ sender: UIButton)
//    {
//        sender.pulsate()
//    }
    
    
    @IBAction func button(_ sender: UIButton) {
        print("hello")
        sender.pulsate()
//        self.hide_fire()
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
        var button_index = 0
        var extinguished = false
        while button_index < 10 && !extinguished {
           let button = get_button(button_index: button_index)
           if !button.isHidden {
               button.isHidden = true // add animation
               extinguished = true
           } // else fire in location of button_index was already shown
           button_index += 1
        }
    }
    
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
    }
    
    func get_button(button_index: Int) -> UIButton{
        return self.view.viewWithTag(button_index) as! UIButton
    }

    @IBAction func theSouthFire(_ sender: AnyObject)
    {
//        self.show_fire(button_index: 1)
        self.hide_fire()
    }
    
}

