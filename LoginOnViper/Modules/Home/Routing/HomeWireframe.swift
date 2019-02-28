

import UIKit

class HomeWireframe: NSObject, HomeWireframeProtocol {
    
    var window: UIWindow?
    var splashScreenNavigation: SplashWireframe?
    var homeViewController: HomeViewController?

    func presentHomeViewControllerInWindow() {
        let homeViewController = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        
        self.homeViewController = homeViewController
        homeViewController?.navigation = self
        homeViewController?.interator = HomeInteractor()
        window!.rootViewController = homeViewController
        window!.makeKeyAndVisible()
    }
    
    func dismissHomeViewController() {
        homeViewController?.dismiss(animated: true, completion: nil)
        splashScreenNavigation = SplashWireframe.sharedInstance
        splashScreenNavigation?.presentSplashScreenViewControllerInWindow()
    }
}
