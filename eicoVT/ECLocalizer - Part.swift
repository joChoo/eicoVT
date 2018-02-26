//
//  Part.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 01/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit



// ================================================================
//          CLASS
// ================================================================

/*
 
 La class ECPart définie l'entité anatomique ou fonctionnelle de base du modèle ECHuman
 
 Elle est elle-même constituée de parts, comme elle est constituée de subparts.
    Ses parts définissent l'arborescence anatomique et fonctionnelle et la navigation dans l'ontologie.
    Ses subparts définissent ce qui permet d'assurer le suivi biometrique de la Part.
 
 
 */





class Part:ECLocalizer {
    
    var name:String
    var parts:[Part] = []
    var subparts:[Subpart] = []
    
    init(name:String){
        self.name = name
    }
    
    init(name:String, subtitle:String, description:String){
        self.name = name
        super.init()
        super.title = name
        super.subtitle = subtitle
        super.description = description
    }
    
    func addPart(part:Part){
        parts.append(part)
    }
    func addSubparts(parts:[Subpart]){
        subparts.append(contentsOf: parts)
        print("adding subparts : \(parts)")
    }
    
}
