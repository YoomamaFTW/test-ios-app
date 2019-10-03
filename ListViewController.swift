import UIKit

extension UIView {
    
    func fadeIn(duration: TimeInterval = 0.2, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
        self.alpha = 1.0
        }, completion: completion)  }
    
    func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.0
            }, completion: completion)
    }
    //https://stackoverflow.com/questions/35385856/how-to-make-a-label-fade-in-or-out-in-swift
}


class ListViewController: UIViewController {
    
    var noDataLbl: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        //addLevelButton()
        
        noDataLbl = UILabel(frame: CGRect(x: 0, y: self.view.center.y, width: 290, height: 70))
        noDataLbl?.text = "1"
        noDataLbl?.textAlignment = .center
        noDataLbl?.font = UIFont(name: "Halvetica", size: 18.0)
        noDataLbl?.numberOfLines = 0
        noDataLbl?.lineBreakMode = .byTruncatingTail
        view.addSubview(noDataLbl!)
        noDataLbl?.isHidden = true
        noDataLbl?.center = self.view.center

        addLevelSlider()
    }
    
    private func addLevelSlider() {
        let slider = UISlider()
        slider.frame = CGRect(x: self.view.frame.origin.x + 150, y: (self.view.frame.height/2 - 20), width: (self.view.frame.height/2), height: 40)
        //noDataLbl?.center = CGPoint(x: slider.frame.midX, y: slider.frame.minY)
        slider.minimumValue = 1
        slider.maximumValue = 20
        slider.value = 1
        slider.isContinuous = true
        slider.tintColor = .green
        slider.minimumTrackTintColor = .clear
        slider.maximumTrackTintColor = .clear
        slider.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        slider.addTarget(self, action: #selector(ListViewController.onSliderValChanged(sender:event:)), for: .valueChanged)
        self.view.addSubview(slider)
        
    }
    
    @objc func onSliderValChanged(sender: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
                case .began:
                    noDataLbl?.fadeIn()
                case .moved:
                    sender.minimumTrackTintColor = .green
                    sender.maximumTrackTintColor = .red
                    //let trackRect = sender.trackRect(forBounds: sender.frame)
                    //let thumbRect = sender.thumbRect(forBounds: sender.bounds, trackRect: trackRect, value: sender.value)
                    //noDataLbl?.center = CGPoint(x: sender.center.x, y: thumbRect.origin.y)
                    noDataLbl?.text = "Level \(Int(sender.value))"
                    noDataLbl?.isHidden = false
                case .ended:
                    sender.value = round(sender.value)
                    sender.minimumTrackTintColor = .clear
                    sender.maximumTrackTintColor = .clear
                    noDataLbl?.fadeOut()
                    //noDataLbl?.isHidden = true
                default:
                    break
            }
        }
    }
    
    // MARK: Original button tapping animation and functionality
    
    @objc func buttonTapped(sender: UIButton) {
        print("Button Tapped")
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)

        UIView.animate(withDuration: 2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIView.AnimationOptions.allowUserInteraction,
                                   animations: {
                                    sender.transform = CGAffineTransform.identity
            },
                                   completion: { Void in()  }
        )
    }
    
    private func addLevelButton() {
        let settingsButton = UIButton()
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.addTarget(self, action: #selector(ListViewController.buttonTapped), for: .touchUpInside)
        let btnImage = UIImage(named: "hamburger-menu-icon")
        settingsButton.setImage(btnImage, for: UIControl.State.normal)
        view.addSubview(settingsButton)
        
        let horizontalCenter = NSLayoutConstraint(item: settingsButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0)

        let verticalCenter = NSLayoutConstraint(item: settingsButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerYWithinMargins, multiplier: 1.0, constant: 0)
        
        let width = NSLayoutConstraint(item: settingsButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 30)
        
        let height = NSLayoutConstraint(item: settingsButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 30)
        
        let constraints: [NSLayoutConstraint] = [horizontalCenter, verticalCenter, width, height]
        
        NSLayoutConstraint.activate(constraints)
    }

    
    
}
