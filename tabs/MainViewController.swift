import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var newSafeArea = UIEdgeInsets()
        newSafeArea.bottom = AppDelegate.shared().mainTabBarController.tabBar.frame.size.height
               
        view.backgroundColor = .blue
        addButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.shared().mainTabBarController.tabBar.isHidden = false;
    }
    
    @objc func buttonTapped() {
        print(AppDelegate.shared().mainTabBarController.view.frame.maxY)
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
        AppDelegate.shared().mainTabBarController.tabBar.isHidden = true;
    }
    
    private func addButton() {
        let mainButton = UIButton()
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        
        mainButton.addTarget(self, action: #selector(MainViewController.buttonTapped), for: .touchUpInside)
        mainButton.setTitle("Go To Detail", for: .normal)
        mainButton.setTitleColor(.orange, for: .normal)
        mainButton.backgroundColor = .green
        
        view.addSubview(mainButton)
                
        let horizontalCenter = NSLayoutConstraint(item: mainButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        
        let verticalCenter = NSLayoutConstraint(item: mainButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)
        
        let width = NSLayoutConstraint(item: mainButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 100)
        
        let height = NSLayoutConstraint(item: mainButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 75)
        
        let constraints: [NSLayoutConstraint] = [horizontalCenter, verticalCenter, width, height]
        
        NSLayoutConstraint.activate(constraints)

    }
}
