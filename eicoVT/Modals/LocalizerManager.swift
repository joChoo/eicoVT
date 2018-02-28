//
//  LocalizerManager.swift
//  eicoVT
//
//  Created by ingouackaz on 28/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts

class LocalizerManager:NSObject {
    static var sharedInstance: LocalizerManager = {
        
        let instance = LocalizerManager()
        return instance
    }()
    
    class func getCommentDataFor(niveau:XLocalizer, completion:@escaping (_ succeed:Bool, _ teams:[PFComment]?) -> Void){
        
        PFComment.getPublicCommentsFor(niveau: niveau) { (succed, comment) in
            completion(succed, comment)
        }
    }
    
    class func getLocalizerItemsFor(niveau:XLocalizer, completion:@escaping (_ succeed:Bool, _ objects1:[PFObject]?, _ objects2:[PFObject]?,  _ comments:[PFComment]?) -> Void){
        
        var dldObject1 : [PFObject] = []
        var dldObject2 : [PFObject] = []
        
        switch (niveau) {
        // On clique sur Patient0
        case (.niveauA):
            PFPatient0.getAllPatients0(completion: { (succeed, patients) in
                dldObject1 = patients!
                // Récupérer les commentaire du localizer courant
                PFComment.getPublicCommentsFor(niveau: niveau) { (succed, comments) in
                    completion(succed, dldObject1, dldObject2, comments)
                }                
            })
            // récupère les items du localizer
            print("")
        default:
            print("")
        }
    }

}
