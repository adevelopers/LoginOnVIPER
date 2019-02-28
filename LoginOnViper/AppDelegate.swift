

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let rootWireframe = RootWireframe()

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if let window = window {
            return rootWireframe.application(didFinishLaunchingWithOptions: launchOptions, window: window)
        }
        return false
    }

    
  
}

