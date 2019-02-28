

import UIKit

class SignupInteractor: NSObject, SignupInteractorProtocol {

    var view: SignupViewController?
    
    func createUser(userModel: UserModel) {
        self.view?.userCreationShow(isSaved: DataStore.default.createUser(userModel: userModel))
    }
}
