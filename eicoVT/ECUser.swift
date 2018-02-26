//
//  ECUser.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 05/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//


import UIKit


enum UserType {
    case clinician, academic
}

class ECUser{
    
    var firstName:String?
    var lastName:String?
    var identifier:String
    var password:String
    var type:UserType
    
    
    
    init(identifier:String, password:String, type:UserType){
        self.identifier = identifier
        self.password = password
        self.type = type
    }
    
    
}
