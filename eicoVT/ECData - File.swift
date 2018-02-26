//
//  ECData - File.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 01/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import SceneKit
import MediaPlayer


enum FileExtension {

    case txt, stl, obj, jpg, jpeg, bmp, csv

}

// ================================================================
//          CLASS
// ================================================================

/*
 
 La classe File est compétente pour recevoir des photos, vidéos, fichiers son ou modèles 3D.
 
 Elle sert de support à l'outil de saisie biométrique qui permet ensuite d'enregistrer des Records, soit des valeurs de Subparts
 

 */




class File:ECData {
    
    // 2D Images
    var image:CGImage?
    var polyfile:[CGImage]?
    
    // 3D Models
    var mesh:MDLMesh?
    var polyMesh:[MDLMesh]?
    
    // Videos
    // Audio
    
    init(image:CGImage){
        self.image = image
    }

    
}
