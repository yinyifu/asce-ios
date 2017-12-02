import UIKit
import TwitterKit

class ViewController: TWTRTimelineViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //The screen name allows to get all tweets for that account in the timeline
        //self.dataSource = TWTRUserTimelineDataSource(screenName: "ASCETweets", apiClient: TWTRAPIClient())
        //Using seach query for hashtags
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "#ios", apiClient: client)
        
        }
        
    
    
}
