//
//  extension(LocalizerSetting) + InfosType.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 15/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit


extension ViewControllerLocalizerSetting {
    
 
    
    
    
    func loadInfos(of localizer:ECLocalizer){
        
        switch settingMode {
       
        // =====================================================================
        // CREATION MODE
        // =====================================================================
       
        case .creation :
        
        
        
        switch type(of: localizer) {
      
        
        case is Nexus.Type:
            
            // TEAM CREATION
            let teamName:LocalizerSetting = LocalizerSetting(name: "name", type: .text, title: "ID", isEditable: true)
            let teamDescription:LocalizerSetting = LocalizerSetting(name: "description", type: .text, title: "Description", isEditable: true)
            let teamTags:LocalizerSetting = LocalizerSetting(name: "tags", type: .list, title: "tags", isEditable: true)
            let privacy:LocalizerSetting = LocalizerSetting(name: "private", type: .bool, title: "private", isEditable: true)
            
            let members:LocalizerSetting = LocalizerSetting(name: "Members", type: .list, title: "Members", isEditable: true)

            settings[0].append(contentsOf: [teamName, teamDescription, teamTags, privacy])
            settings[1].append(contentsOf: [members])
            
            
        case is Team.Type:
            
            // ENTITY CREATION
            
            let firstName:LocalizerSetting = LocalizerSetting(name: "First name", type: .text, title: "First name", isEditable: true)
            let midName:LocalizerSetting = LocalizerSetting(name: "Middle name (optionnal)", type: .text, title: "Middle name", isEditable: true)
            let lastName:LocalizerSetting = LocalizerSetting(name: "Family name", type: .text, title: "Family name", isEditable: true)
            let entityReference:LocalizerSetting = LocalizerSetting(name: "reference", type: .pointer, title: "reference", isEditable: true)
            let grantedUsers:LocalizerSetting = LocalizerSetting(name: "Granted users", type: .list, title: "authorized users", isEditable: true)
            let father:LocalizerSetting = LocalizerSetting(name: "Father", type: .pointer, title: "father", isEditable: true)
            let mother:LocalizerSetting = LocalizerSetting(name: "Mother", type: .pointer, title: "mother", isEditable: true)
            let children:LocalizerSetting = LocalizerSetting(name: "Children", type: .list, title: "children", isEditable: true)
            
            settings[0].append(contentsOf: [firstName, lastName, entityReference])
            settings[1].append(contentsOf: [midName, grantedUsers, father, mother, children])
            
            
        case is Entity.Type:

            // PART CREATION
            
            let partTitle:LocalizerSetting = LocalizerSetting(name: "Name", type: .text, title: "Name", isEditable: true)
            let fma:LocalizerSetting = LocalizerSetting(name: "FMA", type: .text, title: "FMA", isEditable: true)
            let partDescription:LocalizerSetting = LocalizerSetting(name: "Description", type: .text, title: "Description", isEditable: true)
           
            let parts:LocalizerSetting = LocalizerSetting(name: "Parts", type: .list, title: "Parts", isEditable: true)
            let subparts:LocalizerSetting = LocalizerSetting(name: "Subparts", type: .list, title: "Subparts", isEditable: true)
        
     
            settings[0].append(contentsOf: [partTitle, partDescription])
            settings[1].append(contentsOf: [fma, parts, subparts])

            
        case is Part.Type:

            // SUBPART CREATION
            
            let subpartTitle:LocalizerSetting = LocalizerSetting(name: "Name", type: .text, title: "Name", isEditable: true)
            let subpartDescription:LocalizerSetting = LocalizerSetting(name: "Description", type: .text, title: "Description", isEditable: true)
            
            settings[0].append(contentsOf: [subpartTitle, subpartDescription])
            settings[1].append(contentsOf: [])

        
        case is Subpart.Type:

            settings[0].append(contentsOf: [])
            settings[1].append(contentsOf: [])

            
            
        default:
            settings[0].removeAll()
            settings[1].removeAll()
        }
            
            
            
            // =====================================================================
            // EDITION MODE
            // =====================================================================
   
            
            
        case .edition:
            switch type(of: localizer) {
                
                
            case is Nexus.Type:
                
                let nexusDescription:LocalizerSetting = LocalizerSetting(name: "Description", type: .text, title: "Description", isEditable: false)
                let numberOfProjects:LocalizerSetting = LocalizerSetting(name: "Number of projects", type: .text, title: "Number of projects", isEditable: false)
                
                
                settings[0].append(contentsOf: [nexusDescription])
                settings[1].append(contentsOf: [numberOfProjects])

                
                
            case is Team.Type:
                
                settings[0].append(contentsOf: [])
                settings[1].append(contentsOf: [])

                
                
            case is Entity.Type:
                
                settings[0].append(contentsOf: [])
                settings[1].append(contentsOf: [])

                
                
            case is Part.Type:
                
                settings[0].append(contentsOf: [])
                settings[1].append(contentsOf: [])

            case is Subpart.Type:
                
                settings[0].append(contentsOf: [])
                settings[1].append(contentsOf: [])

            default:
                settings[0].removeAll()
                settings[1].removeAll()
            }
        }

    }
    

}
