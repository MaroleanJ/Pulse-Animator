# Pulse-Animator
An UIViewController extension to create dual colour pulse animation

Just drag and drop the PulseAnimation.swift file or jsut copy "UIViewController" extension and use in your application


# Sample Video

https://github.com/maroleanapple/Pulse-Animator/assets/128990360/4b9ebd6b-5117-4526-9bf4-665599b5029d
https://github.com/MaroleanJ/Pulse-Animator/assets/128990360/9455c9fa-38fe-472e-8db2-5291447584a6

# Requirements
iOS 12.0


Xcode 13.0+
Swift 5.0+

# Pulse Animation Usage
In your ViewController to start pulse animation just use
```Swift
self.progressLoader(.start)
```
to stop pulse animation use
```Swift
self.progressLoader(.stop)
```

# code
```Swift
extension UIViewController {
    
    enum Motion {
        case start
        case stop
    }
    
    func progressLoader(_ animate: Motion, pulseColor1: UIColor, pulseColor2: UIColor) {
        DispatchQueue.main.async {
            let pulsator1 = UIView(frame: CGRect(x: self.view.frame.midX-25, y: self.view.frame.midY-25, width: 40, height: 40))
            let pulsator2 = UIView(frame: CGRect(x: self.view.frame.midX-20, y: self.view.frame.midY-20, width: 30, height: 30))
            pulsator1.tag = 1010
            pulsator2.tag = 2020
            pulsator1.layer.cornerRadius = pulsator1.frame.height/2
            pulsator1.backgroundColor = pulseColor1
            
            pulsator2.layer.cornerRadius = pulsator2.frame.height/2
            pulsator2.backgroundColor = pulseColor2
            
            // for pulsating
            let pulse = CABasicAnimation(keyPath: "transform.scale")
            pulse.duration = 0.5
            pulse.repeatCount = .infinity
            pulse.autoreverses = true
            pulse.fromValue = 1.2;
            pulse.toValue = 0.8;
            
            let pulse2 = CABasicAnimation(keyPath: "transform.scale")
            pulse2.duration = 0.5
            pulse2.repeatCount = .infinity
            pulse2.autoreverses = true
            pulse2.fromValue = 1.6;
            pulse2.toValue = 0.6;
            
            // for opacity
            let flash = CABasicAnimation(keyPath: "opacity")
            flash.duration = 0.5
            flash.fromValue = 1
            flash.toValue = 0.2
            flash.timingFunction = CAMediaTimingFunction(name: .easeOut)
            flash.autoreverses = true
            flash.repeatCount = .infinity
            
            if animate == .start {
                self.view.addSubview(pulsator1)
                pulsator1.layer.add(pulse, forKey: "scale")
                pulsator1.layer.add(flash, forKey: "opacity")
                
                self.view.addSubview(pulsator2)
                pulsator2.layer.add(pulse2, forKey: "scale")
                pulsator2.layer.add(flash, forKey: "opacity")
                
            } else {
                
                UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut, animations: {
                    self.view.viewWithTag(1010)?.alpha = 0.0
                    self.view.viewWithTag(2020)?.alpha = 0.0
                }) { _ in
                    self.view.viewWithTag(1010)?.removeFromSuperview()
                    self.view.viewWithTag(1010)?.layer.removeAllAnimations()
                    
                    self.view.viewWithTag(2020)?.removeFromSuperview()
                    self.view.viewWithTag(2020)?.layer.removeAllAnimations()
                }
            }
        }
    }
}
```

# Circular Loader Usage

In your ViewController to start Circular loader, use
```Swift
progressView.show()
```
In your ViewController to stop Circular loader, use
```Swift
progressView.hide()
```

# Circular loader Customizations
```Swift
    func progressView() {
        let progressView = MJAnimateProgressView(frame: CGRect(x: view.frame.midX-75, y: view.frame.midY-75, width: 150, height: 150))
        progressView.animateColor = [ #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)]
        progressView.duration = 1.5
        progressView.lineWidth = 7.5
        progressView.widthProgressView = 100
        progressView.bgColor =  UIColor.clear
        progressView.logoBgColor = UIColor.clear
        progressView.trackColor = UIColor.gray

        view.addSubview(progressView)
        progressView.show()
    }

```

# Author
Marolean James
