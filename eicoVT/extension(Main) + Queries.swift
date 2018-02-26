//
//  extension - VCMain.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 06/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts


extension ViewControllerMain {
    
    
    
    
    func queryLocalizer(localizer:ECLocalizer){
        
        switch type(of: localizer) {
            
            case is Nexus.Type :
            queryNexus()
            
            case is Team.Type :
            queryTeam()
            
            case is Entity.Type :
            queryEntity()
            
            case is Part.Type :
            queryPart(of: currentEntity!)
            
            case is Subpart.Type :
            querySubpart(of: currentEntity!)
            
            default :
            print("none")
        }
    
    print(navigationLists)
    tableNavigation.reloadData()
    tableDatas.reloadData()
    
    }
    
    
    
    
    
    func queryRecords(className:String, objectName:String){
        
        
        // 1 - Find the current subpart
        let partQuery = PFQuery(className: "Subpart")
        partQuery.whereKey("name", equalTo: "SNA")
        
        let query = PFQuery(className: "Records")
        query.whereKey("isRecordOf", matchesQuery: partQuery)
        query.findObjectsInBackground(block: { (objects, error) in
            if error == nil {
                print("object found")
                
                for eachRecord in objects! {
                    //print("\(eachRecord.value(forKey: "value"))")
                    let record = Record(
                        title: "thispart",
                        author: "author",
                        value: CGFloat((eachRecord.value(forKey: "value") as! NSString).floatValue),
                        date: Date())
                    self.datasLists[2].append(record)
                    self.tableDatas.reloadData()
                }
                
            }
                
            else {
                print("error")
                displayAlertIn(vc: self, title: "error", message: "error for data queries", buttonText: "OK")
            }
        })
    }
}


