

import Foundation

protocol UserModelProtocol {
    var userName: String { get }
}

class UserModel: UserModelProtocol {
    
    var inputDictionary = Dictionary<String, AnyObject>()
    
    convenience init(inputDictionary: Dictionary<String, AnyObject>) {
        self.init()
        self.inputDictionary = inputDictionary
    }
    
    var userName: String {
        set(newName) {
            inputDictionary["name"] = newName as AnyObject
        }
        get {
            return (inputDictionary["name"] as? String)!
        }
    }
    
    var password: String {
        set(newPassword) {
            inputDictionary["password"] = newPassword as AnyObject
        }
        get {
            return (inputDictionary["password"] as? String)!
        }
    }
    
}
