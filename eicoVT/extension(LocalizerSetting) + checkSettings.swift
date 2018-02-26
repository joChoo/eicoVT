//
//  extension(LocalizerSetting) + checkSettings.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 18/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts

extension ViewControllerLocalizerSetting {
    
    
    func checkTeam(settings:[[LocalizerSetting]]){
        
        var mandatoryIndex:Int = 0
        var facultativeIndex:Int = 0
        
        let mandatoryCount:Int = settings[0].count
        let facultativeCount:Int = settings[1].count
        
        // Check mandatory informations
        
        for setting in settings[0]{
            var indexPath = IndexPath(index: mandatoryIndex)
            switch setting.type {
            case .text:
                if (tableInfos.cellForRow(at: indexPath) as! TableViewCellSettingString).textfield.text == nil {
                    print("false")
                }
                print("text")
            case .bool:
                 print("text")
            case .list:
                if (tableInfos.cellForRow(at: indexPath) as! TableViewCellSettingList).list.count == 0 {
                    print("false")
                }
                 print("text")
            case .pointer:
                 print("text")
            }
    
            mandatoryIndex += 1

        }
        
        // Check faculative informations
    
        for setting in settings[1]{
            var indexPath = IndexPath(index: facultativeIndex)
            switch setting.type {
            case .text:
                if (tableInfos.cellForRow(at: indexPath) as! TableViewCellSettingString).textfield.text == nil {
                    print("false")
                }
                print("text")
            case .bool:
                print("text")
            case .list:
                print("text")
            case .pointer:
                print("text")
            }
            
            facultativeIndex += 1
        }
        


    }
}
