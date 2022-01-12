
import Foundation

enum userdefaultsKeys: String {
    case timeInterval = "timeInterval"
    case colorScheme = "colorScheme"
    case autorefresh = "autoRefresh"
}

class configuration{
    let defaults = UserDefaults.standard
    static var shared: configuration = configuration()
    
    var timeInterval: Double{
        
        get{
            return defaults.double(forKey: userdefaultsKeys.timeInterval.rawValue)
        }
        set{
            defaults.set(newValue, forKey: userdefaultsKeys.timeInterval.rawValue)
        }
    }
    
    var colorScheme: Int{
        
        get{
            return defaults.integer(forKey: userdefaultsKeys.colorScheme.rawValue)
        }
        set{
            defaults.set(newValue, forKey: userdefaultsKeys.colorScheme.rawValue)
        }
    }
    
    var autorefresh: Bool {
        
        get{
            return defaults.bool(forKey: userdefaultsKeys.autorefresh.rawValue)
        }
        set{
            defaults.set(newValue, forKey: userdefaultsKeys.autorefresh.rawValue)
        }
    }
    
    
    private init(){
        if defaults.double(forKey: userdefaultsKeys.timeInterval.rawValue) == 0 {
            defaults.set(8.0, forKey: userdefaultsKeys.timeInterval.rawValue)

        }
        

        
    }
    
}
