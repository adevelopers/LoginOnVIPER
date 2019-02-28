

import UIKit

class SignupWireframe: NSObject, SignupWireframeProtocol {
    
    var signupViewController: SignupViewController?

    func dismissSignupViewController() {
        self.signupViewController?.dismiss(animated: true, completion: nil)
    }
    
    func presentHomeScreen() {
        let homeViewController = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        homeViewController?.navigation = HomeWireframe()
        homeViewController?.navigation?.homeViewController = homeViewController
        self.signupViewController?.present(homeViewController!, animated: true, completion: nil)
    }

}
