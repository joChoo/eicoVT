//
//  extension(Main) + Load.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 09/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts


extension ViewControllerMain {
    
    
    
    func loadNibFiles(of localizer:ECLocalizer){
        
        let nibLocalizer:UINib = UINib(nibName: "TableViewCellLocalizer", bundle: Bundle.main)
        let nibSearch:UINib = UINib(nibName: "TableViewCellSearch", bundle: Bundle.main)
        let nibFile:UINib = UINib(nibName: "TableViewCellFile", bundle: Bundle.main)
        let nibComment:UINib = UINib(nibName: "TableViewCellComment", bundle: Bundle.main)
       
        tableNavigation.register(nibLocalizer, forCellReuseIdentifier: "localizerCell")
        tableDatas.register(nibComment, forCellReuseIdentifier: "commentCell")
        tableDatas.register(nibFile, forCellReuseIdentifier: "fileCell")
        //tableSearch.register(nibSearch, forCellReuseIdentifier: "searchCell")
        
       
        switch type(of: localizer) {

            case is Nexus.Type :
               
                print("loading nibs for NEXUS : agora, file")
                
                let nibProject:UINib = UINib(nibName: "TableViewCellProject", bundle: Bundle.main)
                let nibAgora:UINib = UINib(nibName: "TableViewCellAgora", bundle: Bundle.main)
                tableDatas.register(nibProject, forCellReuseIdentifier: "projectCell")
                tableDatas.register(nibAgora, forCellReuseIdentifier: "agoraCell")
            
            case is Team.Type :
            
                let nibProject:UINib = UINib(nibName: "TableViewCellProject", bundle: Bundle.main)
                tableDatas.register(nibProject, forCellReuseIdentifier: "projectCell")
          
            case is Entity.Type :
            
                let nibRecord:UINib = UINib(nibName: "TableViewCellRecord", bundle: Bundle.main)
                tableDatas.register(nibRecord, forCellReuseIdentifier: "recordCell")

            case is Part.Type :
            
                let nibRecord:UINib = UINib(nibName: "TableViewCellRecord", bundle: Bundle.main)
                tableDatas.register(nibRecord, forCellReuseIdentifier: "recordCell")

            case is Subpart.Type :
            
                let nibRecord:UINib = UINib(nibName: "TableViewCellRecord", bundle: Bundle.main)
                tableDatas.register(nibRecord, forCellReuseIdentifier: "recordCell")
                
                let nibWatch:UINib = UINib(nibName: "TableViewCellWatch", bundle: Bundle.main)
                 tableDatas.register(nibWatch, forCellReuseIdentifier: "watchCell")
                
                let nibSemiology:UINib = UINib(nibName: "TableViewCellSemiology", bundle: Bundle.main)
                 tableDatas.register(nibSemiology, forCellReuseIdentifier: "semiolopgyCell")
                
                let nibDiagnosis:UINib = UINib(nibName: "TableViewCellDiagnosis", bundle: Bundle.main)
                 tableDatas.register(nibDiagnosis, forCellReuseIdentifier: "diagnosisCell")
                
                let nibMeasure:UINib = UINib(nibName: "TableViewCellMeasure", bundle: Bundle.main)
                 tableDatas.register(nibMeasure, forCellReuseIdentifier: "measureCell")
                
                let nibLandmark:UINib = UINib(nibName: "TableViewCellLandmark", bundle: Bundle.main)
                tableDatas.register(nibLandmark, forCellReuseIdentifier: "landmarkCell")
            
   
        default:
            
            print("unknown localizer : unable to load nib files")
        
        }
    
    
    }}
