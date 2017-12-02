import UIKit
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let consumer_key: String = "VGALxbf0t3DLpGZ3nexIJv2g3"
    let consumer_secret: String = "IzIH36MpXyAMLdvUEMPBkKGebelqHoSbLPrOFfTX6oupA0LK7S"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // grab app keys from Twitter.plist in app bundle
        // avoids having to have that file in source control...
        if let url = Bundle.main.url(forResource:"Twitter", withExtension: "plist") {
            do {
                let data = try Data(contentsOf:url)
                _ = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [String:Any]
            } catch {
                print(error)
            }
        }
        
        Twitter.sharedInstance().start(withConsumerKey:consumer_key, consumerSecret:consumer_secret)
        
        return true
    }
}

