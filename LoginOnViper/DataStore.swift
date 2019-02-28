

import Foundation

class DataStore {
    class var `default`: CoreDataEngine {
        return CoreDataEngine.sharedinstance
    }
}
