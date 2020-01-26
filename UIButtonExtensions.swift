//
//  UIButtonExtensions.swift
//  FireFighter
//
//  Created by Canyon Sembera on 1/25/20.
//  Copyright © 2020 TAMUHACK. All rights reserved.
//

import Foundation

import UIKit

extension UIButton
{
    func pulsate()
    {
        
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.4
    pulse.fromValue = 0.90
    pulse.toValue = 1.0
    pulse.autoreverses = true
    pulse.repeatCount = .infinity
    pulse.initialVelocity = 0.5
    pulse.damping = 1.0
    layer.add(pulse, forKey: nil)
    }
}
