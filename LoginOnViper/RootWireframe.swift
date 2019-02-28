

import UIKit

class RootWireframe: NSObject {
  
    let splashScreenWireframe: SplashWireframe?
    
    var homeWireframe: HomeWireframe?
    
    override init() {
        self.splashScreenWireframe = SplashWireframe.sharedInstance
    }
    
    func application(didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?, window: UIWindow) -> Bool {
        self.splashScreenWireframe?.window = window
        self.homeWireframe = HomeWireframe()
        self.homeWireframe?.window = window
        self.checkHasUser()
        return true
    }
    
    func checkHasUser() {
        if DataStore.default.checkUserAvailability() {
            self.homeWireframe?.presentHomeViewControllerInWindow()
        } else {
            self.splashScreenWireframe?.presentSplashScreenViewControllerInWindow()
        }
    }
    
}
