

import Foundation
import CoreData

class CoreDataEngine {
    
    var moc = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
    
    static var sharedinstance = CoreDataEngine()
    
    init() {
        moc = CoreDataManager.sharedInstance.managedObjectContext
    }
    
    func createUser(userModel: UserModel) -> Bool {
        let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: moc)
        let user = User(entity:entityDescription!, insertInto: moc)
        
        user.setValue(userModel.userName, forKey: "name")
        user.setValue(userModel.password, forKey: "password")
        
        do {
            try moc.save()
            print("-- User Got saved! --");
            return true
        } catch {

            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        return false
    }
    
    func checkUserAvailability() -> Bool {
        let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: moc)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = entityDescription
        
        do {
            let result = try moc.fetch(fetchRequest)
            if (result.count == 0) {
                print("\n\nData got empty values")
                return false
            } else {
                return true
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return false
    }
    
    func loginUser(userModel: UserModel) -> Bool {
        let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: moc)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.predicate = NSPredicate(format: "%K==%@", "name", userModel.userName)
        fetchRequest.entity = entityDescription
        
        do {
            let result = try moc.fetch(fetchRequest)
            if (result.count == 1) {
                return true
            } else {
                return false
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return false
    }
    
    func deleteUser() {
        let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: moc)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = entityDescription
        
        do {
            let result = try moc.fetch(fetchRequest)
            if (result.count == 0) {
                print("There's no users!")
                return
            }
            
            let managedObject = result.first
            moc.delete(managedObject as! User)
            try moc.save()
            print("user deleted!")
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
}
