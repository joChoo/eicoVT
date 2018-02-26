//
//  extension(Main) + QuerySubpart.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 12/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts

extension ViewControllerMain {
    
    func querySubpart(of entity:PFObject){
      
        
        let currentPFLocalizerQuery:PFQuery = PFQuery(className: "Subpart")
        currentPFLocalizerQuery.getObjectInBackground(withId: currentLocalizer.objectID!) { (success, error) in
            if error == nil {
                
            }
            else {
                
            }
        }
        
        
        // ======================================
        // LOCALIZERS
        // ======================================
        
        
        
        // ======================================
        // DATAS
        // ======================================
        

        
        
    }
    
}
