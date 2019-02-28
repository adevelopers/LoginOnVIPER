

import UIKit

class LoginInteractor: NSObject, LoginInteractorProtocol {
    
    var view: LoginViewController?
    var userModel: UserModelProtocol?
    

    func loginUser(userModel: UserModel) {
        self.view?.loginUser(with: userModel, isSaved: DataStore.default.loginUser(userModel: userModel))
    }
    
}
