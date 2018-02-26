//
//  ECData - Comment.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 10/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit

class Comment:ECData {
    
    var author:String
    var content:String
    var date:Date
    var answers:[Answers] = []
    
    init(author:String, content:String, date:Date){
        self.author = author
        self.content = content
        self.date = date
    }
    
}


class Answers:ECData {
    
    var author:String
    var content:String
    var date:Date
    
    init(author:String, content:String, date:Date){
        self.author = author
        self.content = content
        self.date = date
    }
    
}
