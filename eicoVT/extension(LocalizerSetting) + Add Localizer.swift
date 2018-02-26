//
//  extension(Main) + Add Localizer.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 18/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts

extension ViewControllerLocalizerSetting {
    
    
    func createTeam(title:String, subtitle:String, description:String){
        let newTeam:Team = Team(title: title, subtitle: subtitle, description: description)
        let newPFTeam:PFObject = PFObject(className: "Team")
            newPFTeam.setObject("\(newTeam.title)", forKey: "title")
            newPFTeam.setObject("\(newTeam.subtitle)", forKey: "subtitle")
            newPFTeam.setObject("\(newTeam.description)", forKey: "description")
            newPFTeam.relation(forKey: "members").add(connectedUser!)
            PFUser.current()?.relation(forKey: "teams").add(newPFTeam)
    }
    
      /*
    func createEntity(){
        let newEntity:Entity = Entity(privacy: <#T##String#>, reference: <#T##Entity#>, firstID: <#T##String#>, lastID: <#T##String#>, opID: <#T##String?#>, birth: <#T##Date#>)
        
    }
    
    func createPart(){
        let newPart:Part = Part(name: <#T##String#>, subtitle: <#T##String#>, description: <#T##String#>)
    }
    
    func createSubpart(){
        let newSubpart:Subpart = Subpart(name: <#T##String#>)
        
    }
    
  
     
     let player = PFObject(className: "Player")
     player.setObject("John", forKey: "Name")
     player.setObject(1230, forKey: "Score")
     player.saveInBackgroundWithBlock { (succeeded, error) -> Void in
     if succeeded {
     println("Object Uploaded")
     } else {
     println("Error: \(error) \(error.userInfo!)")
     }
     }
     */
    
}
