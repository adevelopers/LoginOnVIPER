

import UIKit

class HomeInteractor: NSObject, HomeInteractorProtocol {
    
    func deleteUser() {
        DataStore.default.deleteUser()
    }
    
}
