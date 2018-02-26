//
//  Subpart.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 01/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//


import UIKit
import SceneKit




// ================================================================
//          CLASS
// ================================================================

/*

 Les Subparts sont des entités conceptuelles associées aux entités organiques.
 Elles appartiennent donc à des Parts.
 
 Exemples : 
 let part:Part = Part(name:"MaxilloFacial complex")
    part.subparts =
        Landmark(name:"point J"),
        Landmark(name:"point N"),
        Landmark(name:"point ENP"),
        Measure(name:"SNA", calculation:.angle),
        Measure(name:"ItoNA", calculation:.lenght)
 
 
 
 */




class Subpart:ECLocalizer{
    
    var name:String
    
    init(name:String){
        self.name = name
    }
    
}



// ================================================================
//          SUBCLASSES
// ================================================================


/*
 
 La class Subpart est constituée de deux subclasses: Landmark et Measure
 -  Measure.result est une valeur générée par : Measure.compute
 -  qui vient prendre les Measure.landmarks[index].coordinates
 -  pour calculer selon le Measure.calculation le Measure.result => .Angle ou .Distance
 
 */





// -----------------------------------

class Landmark:Subpart {
    
    // Variables
    var coordinates:SCNVector3?
    
    
    // Initializers
    override init(name:String){
        super.init(name: name)
    }
    
    // Methods
    func point2D(location:CGPoint){
        let vector = SCNVector3(location.x, location.y, 0)
        coordinates = vector
    }
    func point3D(location:SCNVector3){
        coordinates = location
    }
    
}




// -----------------------------------


class Measure:Subpart {
    
    var record:[Record]?
    
    
    
    // Variables
    
    enum Calculation {
        case lenght, angle
    }
    
    var landmarks:[Landmark]
    var calculation:Calculation
    
    
    
    // Initializers
    init(name: String, calculation:Calculation, landmarks:[Landmark]) {
        self.calculation = calculation
        self.landmarks = landmarks
        super.init(name: name)
    }
    

    //Methods
    
    
    func addRecord(value:CGFloat) {
        let newRecord:Record = Record(title: self.name, author: "current user", value: value, date: Date())
        record?.append(newRecord)
    }
    
    func compute(){
        
        switch calculation {
        case .lenght:
            print("calculating lenght")
            if landmarks.count != 2 {
                print("error, 2 Landmarks are required")
            }
            else {
                let pointA:CGPoint = CGPoint(x: CGFloat((landmarks[0].coordinates?.x)!), y: CGFloat((landmarks[0].coordinates?.y)!))
                let pointB:CGPoint = CGPoint(x: CGFloat((landmarks[1].coordinates?.x)!), y: CGFloat((landmarks[1].coordinates?.y)!))
                let lenght = distance(pointA: pointA, pointB: pointB)
                addRecord(value: lenght)
               
                
            }
        case .angle:
            print("calculating angle")
            if landmarks.count != 3 {
                print("error, 2 Landmarks are required")
            }
            else {
                addRecord(value: 19)
            }
        }
    }
    
}
