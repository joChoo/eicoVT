//
//  extension(Main) + QueryPart.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 12/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts

extension ViewControllerMain{
    
    func queryPart(of entity:PFObject){
        
        let currentPFLocalizerQuery:PFQuery = PFQuery(className: "Part")
        currentPFLocalizerQuery.getObjectInBackground(withId: currentLocalizer.objectID!) { (success, error) in
            if error == nil {
                
            }
            else {
                
            }
        }
        
    
        // ======================================
        // LOCALIZERS
        // ======================================

        let fatherPart:PFQuery = PFQuery(className: "Part")
    
        let brotherPart:PFQuery = PFQuery(className: "Part")
        
        let childrenPart:PFQuery = PFQuery(className: "Part")
        let childrenSubpart:PFQuery = PFQuery(className: "Subpart")
        
        
        
        
        
        // ======================================
        // DATAS
        // ======================================

        
        
        
    }
    
    
}
