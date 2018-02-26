//
//  extension(Main) + QueryEntity.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 12/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts


extension ViewControllerMain {

    

    
    func queryEntity(){
        
        
        let currentPFLocalizerQuery:PFQuery = PFQuery(className: "Entity")
        currentPFLocalizerQuery.getObjectInBackground(withId: currentLocalizer.objectID!) { (success, error) in
            if error == nil {
                
            }
            else {
                
            }
        }
        
        
        // ======================================
        // LOCALIZERS
        // ======================================
        
        
        // Query parent :
        //------------------
        // Je cherche les équipes dont je fais partie
        // Qui ont accès à cette Entity
        
        
        // 1 - Query TEAM of the CurrentUser
        let userIsMemberRelation:PFRelation = (PFUser.current()!.relation(forKey: "isMemberOf"))
        let userIsMemberQuery = userIsMemberRelation.query()
        
        // 2 - Query ENTITY where hasGranted = currentLocalizer.objectId
        let entityHasGrantedRelation:PFRelation = (PFObject.init(withoutDataWithClassName: "Entity", objectId: currentLocalizer.objectID)).relation(forKey: "hasGranted")
        let entityHasGrantedQuery = entityHasGrantedRelation.query()
        
        let navParentQuery:PFQuery = entityHasGrantedQuery
        navParentQuery.whereKey("hasGranted", matchesQuery: userIsMemberQuery)
        navParentQuery.findObjectsInBackground(block: { (teams, error) in
            if error == nil {
                print("the current entity has given access to \(teams?.count) teams")
                for team in teams! {
                    let newTeam:Team = Team(
                        title: "title",
                        subtitle: "subtitle",
                        description: "information")
                    self.navigationLists[0].append(newTeam)
                }
            }
            else {
                print("ERROR in finding teams for the current entity")
            }
        })
        
        
        
        
        // Query brother
        //------------------
        
       let currentEntityQuery = PFQuery(className: "Entity")
            currentEntityQuery.whereKey("objectId", equalTo: currentLocalizer.objectID)
        
        // Query Entity.relatives
        let relativesQuery:PFQuery = PFQuery(className: "Entity")
            relativesQuery.whereKey("children", matchesQuery: currentEntityQuery)
            relativesQuery.whereKey("father", matchesQuery: currentEntityQuery)
            relativesQuery.whereKey("mother", matchesQuery: currentEntityQuery)
        
        
        
        
        // Query children
        //------------------
        // Query parts
        //      whereKey template == Entity.reference
        //      whereKey type contains "region", "system"
        
        
        
        let partsQuery = PFQuery(className: "Part")
            partsQuery.whereKey("type", equalTo: "region")
            partsQuery.whereKey("type", equalTo: "system")
        
    }

}
