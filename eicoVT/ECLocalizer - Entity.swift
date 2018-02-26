//
//  ECLocalizer - Entity.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 02/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit



class Entity:ECLocalizer {
    
    enum EntityPrivacy {
    case template, templateAlpha , identified
    }
    
    
    var privacy:String?
    var reference:Entity?
    
    var firstID, lastID, optionalID:String?
    var birth:Date?
    var sex:String?
    
    var domainTaxon, kingdomTaxon, phylumTaxon, classTaxon, orderTaxon, familyTaxon, genusTaxon, specyTaxon:String?
    
    override init(){
        
    }

    init(privacy:String, reference:Entity, firstID:String, lastID:String, opID:String?, birth:Date){
    
        self.privacy = privacy
        self.reference = reference
        self.firstID = firstID
        self.lastID = lastID
        self.optionalID = opID
        self.birth = birth
        
        self.reference = reference
        self.domainTaxon = reference.domainTaxon
        self.kingdomTaxon = reference.kingdomTaxon
        self.phylumTaxon = reference.phylumTaxon
        self.classTaxon = reference.classTaxon
        self.orderTaxon = reference.orderTaxon
        self.familyTaxon = reference.familyTaxon
        self.genusTaxon = reference.genusTaxon
        self.specyTaxon = reference.specyTaxon
    
    }
    
}
