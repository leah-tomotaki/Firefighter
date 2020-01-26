//
//  SecondViewController.swift
//  FireFighter1
//
//  Created by Marco Loporcaro on 1/25/20.
//  Copyright © 2020 Aneil Marathi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func openWWF(_ sender: UIButton) {
        if let url = URL(string: "https://support.worldwildlife.org/site/SPageServer?pagename=main_monthly_donation&s_src=AWE2007OQ18299A03750TX&_ga=2.187203880.1201351831.1579998450-261951289.1579998450&utm_expid=.qBvd77OvSHa1j80j1U0DHQ.2&utm_referrer=https%3A%2F%2Fwww.worldwildlife.org%2F") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func Koala(_ sender: Any) {
        if let url = URL(string: "https://shop.koalahospital.org.au/collections/donations/products/donation") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func Kangaroo(_ sender: Any) {
        if let url = URL(string: "https://www.gofundme.com/f/help-save-kangaroo-islands-koalas-and-wildlife") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func ARC(_ sender: Any) {
        if let url = URL(string: "https://www.redcross.org.au/campaigns/donation-selection") {
            UIApplication.shared.open(url)
        }
    }
}

