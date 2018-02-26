//
//  extension(Mail) + QueryNexus.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 12/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//


import UIKit
import Parse
import Bolts


extension ViewControllerMain {
    
    func queryNexus(){
 
        
        
        // ======================================
        // LOCALIZERS
        // ======================================
        
        
        // QUERY PARENT ---------------------------
        
        // QUERY BROTHER ---------------------------
        
        let queryNavBrothers = PFQuery(className: "Entity")
        queryNavBrothers.whereKey("privacy", equalTo: "template")
        queryNavBrothers.includeKeys(["privacy", "reference","firstID","lastID","optionalID","birth"])
        queryNavBrothers.findObjectsInBackground(block: { (objects, error) in
            
            if error == nil {
                print("PFQUERY(localizer) : \(objects?.count) brothers found")
                
                for object in objects! {
                    
                    let newEntity = Entity()
                    newEntity.firstID = "\(object.value(forKey: "firstID"))"
                    newEntity.objectID = object.objectId
                    print("\(object.value(forKey: "privacy"))")
                    print("\(object.value(forKey: "reference"))")
                    print("\(object.value(forKey: "firstID"))")
                    print("\(object.value(forKey: "lastID"))")
                    print("\(object.value(forKey: "optionalID"))")
                    print("\(object.value(forKey: "birth"))")
                    self.navigationLists[1].append(newEntity)
                    self.tableNavigation.reloadData()
                }
            }
            else {
                print(error.debugDescription)
            }
        })
        

        
        // QUERY CHILDREN ---------------------------
        
        
        let userTeamsRelation:PFRelation = (PFUser.current()!.relation(forKey: "teams"))
        let queryNavChildren:PFQuery = userTeamsRelation.query()
        queryNavChildren.includeKeys(["title","subtitle","information"])
        queryNavChildren.findObjectsInBackground(block: { (teams, error) in
            if error == nil {
                
                print("children founds : \(teams?.count)")
                
                for team in teams! {
                    print("\(team.value(forKey: "title"))")
                    print("\(team.value(forKey: "subtitle"))")
                    print("\(team.value(forKey: "information"))")
                    let newTeam:Team = Team(
                        title: team.value(forKey: "title") as! String,
                        subtitle: team.value(forKey: "subtitle") as! String,
                        description: team.value(forKey: "information") as! String)
                    newTeam.objectID = team.objectId
                    self.navigationLists[2].append(newTeam)
                    self.tableNavigation.reloadData()
                    
                }
            }
            else {
                print(error.debugDescription)
            }
            
        })

        
        let queryDataComment = PFQuery(className: "Comments")
        queryDataComment.whereKey("privacy", equalTo: "shared")
        queryDataComment.findObjectsInBackground(block: { (objects, error) in
            if error == nil {
                print("PFQUERY(datas) : \(objects?.count) comments found")
                for object in objects! {
                    let newComment = Comment(
                        author: "author",
                        content: "content",
                        date: Date())
                    self.datasLists[2].append(newComment)
                    self.tableDatas.reloadData()
                }
            }
            else {
                print(error.debugDescription)
            }
        })
    }
}
