//
//  ViewController.swift
//  Pulser
//
//  Created by maroleanj on 20/07/23.
//

import UIKit

class ViewController: UIViewController {

    var circularLoader = MJAnimateProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start Pulse animation
//        self.progressLoader(.start, pulseColor1: .black, pulseColor2: .black)
        // Setup Circular Loader animation
        setupCircularLoader()
        
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
            // Stop Pulse animation
//            self.progressLoader(.stop, pulseColor1: .black, pulseColor2: .black)
            // Stop circularLoader animation
            self.circularLoader.hide()
        }
        // Do any additional setup after loading the view.
    }


    func setupCircularLoader() {
        circularLoader = MJAnimateProgressView(frame: CGRect(x: view.frame.midX-75, y: view.frame.midY-75, width: 150, height: 150))
        circularLoader.animateColor = [#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)]
        circularLoader.duration = 3
        circularLoader.lineWidth = 7.5
        circularLoader.widthProgressView = 100
        circularLoader.bgColor =  UIColor.clear
        circularLoader.trackColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)

        view.addSubview(circularLoader)
        circularLoader.show()
    }
    
}

