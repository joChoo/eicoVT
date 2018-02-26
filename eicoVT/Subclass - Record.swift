//
//  Subclass - Record.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 01/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit


class Record:ECData {
    
    var title:String
    var value:CGFloat
    var date:Date
    var author:String
    var isVisible:Bool = true
    
    init(title:String, author:String, value:CGFloat, date:Date){
        self.title = title
        self.author = author
        self.value = value
        self.date = date
    }
    
    func editVisibility(){
        switch isVisible {
        case true: isVisible = false
        case false: isVisible = true
        }
    }
        
}
