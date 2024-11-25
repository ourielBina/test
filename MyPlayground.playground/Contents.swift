import UIKit
struct UserInfo:Codable{
    var idNum: String
    var firstName: String
    var lastName: String
    var birthDate: String
    
}
class UserData{
    private enum Keys {
        static let userInfo = "userInfo"
    }
    private let defaults: UserDefaults
    
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        defaults.register(defaults: [
            Keys.userInfo: Data(),
        ])
    }
    
    func reset() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
    var userInfo: UserInfo? {
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                defaults.set(encoded, forKey: Keys.userInfo)
            }
        }
        get {
            if let savedUserInfo = defaults.object(forKey: Keys.userInfo) as? Data {
                if let loadedUserInfo = try? JSONDecoder().decode(UserInfo.self, from: savedUserInfo) {
                    return loadedUserInfo
                }
            }
            return nil
        }
    }
}
UserData().userInfo?.idNum = "1234"
print(UserData().userInfo?.idNum)
