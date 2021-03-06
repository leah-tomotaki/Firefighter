//
//  UIButtonExtension.swift
//  FireFighter1
//
//  Created by Marco Loporcaro on 1/26/20.
//  Copyright © 2020 Aneil Marathi. All rights reserved.
//

import Foundation

import UIKit

extension UIButton
{
    func pulsate() {
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.4
    pulse.fromValue = 0.98
    pulse.toValue = 1.0
    pulse.autoreverses = true
    pulse.repeatCount = .infinity
    pulse.initialVelocity = 0.5
    pulse.damping = 1.0
    layer.add(pulse, forKey: nil)
    }
}
