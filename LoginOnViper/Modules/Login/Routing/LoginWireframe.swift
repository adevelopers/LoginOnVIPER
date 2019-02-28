

import UIKit

class LoginWireframe: NSObject, LoginWireframeProtocol{
    
    var loginViewController: LoginViewController?

    func dismissLoginViewController() {
        self.loginViewController?.dismiss(animated: true, completion: nil)
    }
    
    func presentHomeScreen(with user: UserModelProtocol) {
    
        let homeViewController = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        homeViewController?.configure(with: user)
        homeViewController?.navigation = HomeWireframe()
        homeViewController?.navigation?.homeViewController = homeViewController
        self.loginViewController?.present(homeViewController!, animated: true, completion: nil)
    }
}
