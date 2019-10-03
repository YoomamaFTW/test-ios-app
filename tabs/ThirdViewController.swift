/*
 Failed attempt at the slider thing. New plan... when slider thumb moving,
 find the y value of the first finger and set the value like that
 */
import UIKit

class ThirdViewController: UIViewController {
    
    let numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let slider = UISlider()
    
    var labelCenter: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        var newSafeArea = UIEdgeInsets()
        newSafeArea.bottom = AppDelegate.shared().mainTabBarController.tabBar.frame.size.height
               
        numberLabel.text = "123456789012345678901234567890"
        addLevelSlider(slider: slider)
        
        numberLabel.center = CGPoint(x: 150, y: 285)
        numberLabel.textAlignment = .center
        self.view.addSubview(numberLabel)
    }

    
    private func addLevelSlider(slider: UISlider) {
        slider.frame = CGRect(x: self.view.frame.origin.x + 150, y: (self.view.frame.height/2 - 20), width: (self.view.frame.height/2), height: 1)
        slider.minimumValue = 1
        slider.maximumValue = 20
        slider.value = 1
        slider.isContinuous = true
        slider.tintColor = .green
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .red
        slider.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        labelCenter = slider.center.y
        print(labelCenter)
        slider.addTarget(self, action: #selector(ThirdViewController.onSliderValChanged(sender:event:)), for: .valueChanged)
        self.view.addSubview(slider)
        
    }
    
    @objc func onSliderValChanged(sender: UISlider, event: UIEvent) {
        
        let currentValue: CGFloat = CGFloat(sender.value)
        numberLabel.text = String(describing: Int(currentValue))
        let trackRect = slider.trackRect(forBounds: slider.bounds)
        let sliderThumbRect = slider.thumbRect(forBounds: slider.bounds, trackRect: trackRect, value: slider.value)
        numberLabel.center = CGPoint(x: slider.center.x, y: sliderThumbRect.origin.y + labelCenter)
        print("X: \(slider.center.x), Y: \(slider.center.y)")
        print("X: \(slider.center.x), Y: \(sliderThumbRect.origin.y + labelCenter)")

    }
    
}
