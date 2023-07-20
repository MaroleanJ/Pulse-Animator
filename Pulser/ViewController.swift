//
//  ViewController.swift
//  Pulser
//
//  Created by maroleanj on 20/07/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start Pulse animation
        self.progressLoader(.start, pulseColor1: .black, pulseColor2: .black)
        
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
            // Stop Pulse animation
            self.progressLoader(.stop, pulseColor1: .black, pulseColor2: .black)
        }
        // Do any additional setup after loading the view.
    }


}

