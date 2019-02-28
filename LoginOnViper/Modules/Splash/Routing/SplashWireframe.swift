

import UIKit

class SplashWireframe: NSObject, SplashWireframeProtocol {
    
    static var sharedInstance = SplashWireframe()
    
    var splashScreenViewVontroller: SplashViewController?
    var window: UIWindow?
    
    func presentSplashScreenViewControllerInWindow() {
        let splashScreenViewController = UIStoryboard(name: "Splash", bundle: nil).instantiateViewController(withIdentifier: "SplashViewController") as? SplashViewController
        self.splashScreenViewVontroller = splashScreenViewController
        self.splashScreenViewVontroller?.navigation = self
        self.window!.rootViewController = splashScreenViewVontroller
        self.window!.makeKeyAndVisible()
    }
    
    func presentLoginViewController() {
        let loginViewController = UIStoryboard.init(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        loginViewController?.interactor = LoginInteractor()
        loginViewController?.interactor?.view = loginViewController
        loginViewController?.navigation = LoginWireframe()
        loginViewController?.navigation?.loginViewController = loginViewController
        
        self.splashScreenViewVontroller?.present(loginViewController!, animated: true, completion: nil)
    }
    
    func presentSignupViewController() {
        let signupViewController = UIStoryboard.init(name: "Signup", bundle: nil).instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        signupViewController?.interactor = SignupInteractor()
        signupViewController?.interactor?.view = signupViewController
        signupViewController?.navigation = SignupWireframe()
        signupViewController?.navigation?.signupViewController = signupViewController
        
        self.splashScreenViewVontroller?.present(signupViewController!, animated: true, completion: nil)
    }
    
}
