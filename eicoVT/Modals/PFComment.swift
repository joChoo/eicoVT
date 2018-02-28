//
//  PFTeam.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 21/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts




final class PFComment: PFObject, PFSubclassing {
    

    @NSManaged var author : String?
    @NSManaged var content : String?
    
    init(title : String, subtitle:String, information:String) {
        super.init()
        self.author = title
        self.content = subtitle
    }
    
    override init() {
        super.init()
    }
    
    public class func parseClassName() -> String {
        return "Comment"
    }
    
    override class func query() -> PFQuery<PFObject>? {
        
        let query = PFQuery(className: PFComment.parseClassName())
        query.order(byDescending: "createdAt")
        query.cachePolicy = .networkOnly
        return query
    }
    
    class func getPublicCommentsFor(niveau:XLocalizer, completion:@escaping (_ succeed:Bool, _  comments:[PFComment]?) -> Void){
        
        let query = PFComment.query()
        query?.findObjectsInBackground(block: {
            (objects, error) in
            if error == nil {
                completion(true, objects as! [PFComment])
                print(objects!) // Prints nil
            } else {
                completion(false, nil)
                print(error!.localizedDescription)
            }
        })
    
    }
    
    
}

//
//func test(){
//    
//    PFTeam.getTeamFromCurrentUser { (succeed, teams) in
//        if succeed == true {
////            for team in teams{
////            }
//               // let newTeam = Team(title: <#T##String#>, subtitle: <#T##String#>, description: <#T##String#>)
//        }
//    }
//}
//
//




/*
 func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
 // Override point for customization after application launch.
 
 // MARK: - Parse Setup
 Parse.setApplicationId("YOUR_ID", clientKey: "YOUR_KEY")
 
 // MARK: - Parse Register Subclasses
 Armor.registerSubclass()
 
 return true
 }
 
 
 
 */
