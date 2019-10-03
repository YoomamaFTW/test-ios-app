import UIKit
import Parchment


class SecondaryViewController: UIViewController {
    var leftConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // https://developer.apple.com/documentation/uikit/uiview/positioning_content_relative_to_the_safe_area
        var newSafeArea = UIEdgeInsets()
        newSafeArea.bottom = AppDelegate.shared().mainTabBarController.tabBar.frame.size.height
        
        view.backgroundColor = .white

        let savedViewController = ListViewController()
        savedViewController.title = "Saved"
        let userViewController = ListViewController()
        userViewController.title = "User"
        let publicViewController = ListViewController()
        publicViewController.title = "Public"
        let wallViewController = ListViewController()
        wallViewController.title = "Wall"
        
        let topPagingViewController = FixedPagingViewController(viewControllers: [savedViewController, userViewController, publicViewController, wallViewController])
        
        topPagingViewController.contentInteraction = .none
        // disables the page scrolling. Perfect when slider is enabled.
        
        addChild(topPagingViewController)
        view.addSubview(topPagingViewController.view)
        topPagingViewController.didMove(toParent: self)
        topPagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        topPagingViewController.menuItemSize = .sizeToFit(minWidth: 50, height: 40)

        NSLayoutConstraint.activate([
            topPagingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          topPagingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
          topPagingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
          topPagingViewController.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: UIApplication.shared.statusBarFrame.height)
        ])
    }
}
