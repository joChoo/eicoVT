//
//  extension(Main) + QueryTeam.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 12/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit

import Parse
import Bolts


extension ViewControllerMain {
    
    func queryTeam(){
       
        let currentPFLocalizerQuery:PFQuery = PFQuery(className: "Team")
            currentPFLocalizerQuery.getObjectInBackground(withId: currentLocalizer.objectID!) { (success, error) in
                if error == nil {
                    
                }
                else {
                    
                }
        }
        
        // ==================================================
        // LOCALIZERS
        // ==================================================
        
        
        
        // -----------------------------------------
        // Query PARENTS = Nexus()
        // -----------------------------------------
        
        let newParent = Nexus()
        self.navigationLists[0].append(newParent)
        
        
        
         // -----------------------------------------
         // Query BROTHERS = CurrentUser.teams
         // -----------------------------------------
        
        let userTeamsRelation:PFRelation = (PFUser.current()!.relation(forKey: "isMemberOf"))
        let queryNavBrother:PFQuery = userTeamsRelation.query()
        queryNavBrother.includeKeys(["title","subtitle","information, objectId"])
        queryNavBrother.findObjectsInBackground(block: { (teams, error) in
            if error == nil {
                
                print("children founds : \(teams?.count)")
                for team in teams! {
                    print("\(team.value(forKey: "title"))")
                    print("\(team.value(forKey: "subtitle"))")
                    let newTeam:Team = Team(
                        title: team.value(forKey: "title") as! String,
                        subtitle: team.value(forKey: "subtitle") as! String,
                        description: team.value(forKey: "information") as! String)
                        newTeam.objectID = team.value(forKey: "objectId") as! String
                    self.navigationLists[1].append(newTeam)
                    self.tableNavigation.reloadData()
                    
                }
            }
            else {
                print(error.debugDescription)
            }
            
        })
        
        
         // -----------------------------------------
         // Query CHILDREN = CurrentUser.grantedEntities
         // -----------------------------------------
      
        let queryNavChildren = PFQuery(className: "Entity")
        queryNavChildren.whereKey("privacy", equalTo: "template")
        queryNavChildren.includeKeys(["privacy", "reference","firstID","lastID","optionalID","birth"])
        queryNavChildren.findObjectsInBackground(block: { (objects, error) in
            
            if error == nil {
                print("PFQUERY(localizer) : \(objects?.count) brothers found")
                
                for object in objects! {
                    
                    let newEntity = Entity()
                    /*let newEntity = Entity(
                     privacy: object.value(forKey: "privacy") as! String,
                     reference: Entity(),
                     firstID: object.value(forKey: "firstID") as! String,
                     lastID: object.value(forKey: "lastID") as! String,
                     opID: object.value(forKey: "optionalID") as! String,
                     birth: object.value(forKey: "birth") as! Date)
                     
                     */
                    print("\(object.value(forKey: "privacy"))")
                    print("\(object.value(forKey: "reference"))")
                    print("\(object.value(forKey: "firstID"))")
                    print("\(object.value(forKey: "lastID"))")
                    print("\(object.value(forKey: "optionalID"))")
                    print("\(object.value(forKey: "birth"))")
                    self.navigationLists[2].append(newEntity)
                    self.tableNavigation.reloadData()
                }
            }
            else {
                print(error.debugDescription)
            }
        })

        
      
        // ==================================================
        // QUERY DATAS
        // ==================================================
        
        // -----------------------------------------
        // Query ALERT
        // -----------------------------------------

        
        // -----------------------------------------
        // Query WATCH
        // -----------------------------------------

        
        // -----------------------------------------
        // Query ALL
        // -----------------------------------------

        
    }
    
}
