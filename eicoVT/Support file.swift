//
//  Support file.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 01/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import Foundation
import UIKit
import SceneKit



//--------------------------------------------------------------------------------------------------------
// View controller



func displayAlertIn(vc:UIViewController,title:String, message:String, buttonText:String){
let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: {(action) in}))
    vc.present(alert, animated: true, completion: nil)
}




func formatDate(date:Date)->String{
    
    var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy - h:mm a"
    
    let result = dateFormatter.string(from: date)
    return result
}

func sortByDate(datas:[ECData]){

}


//--------------------------------------------------------------------------------------------------------
// Mathematics

func mean(datas:[Float])->Float{
    var sum:Float = 0
    for data in datas {
        sum += data
    }
    return sum/Float(datas.count)
}

func variance(datas:[Float])->Float{
    var sum:Float = 0
    for data in datas {
        sum += ((data - mean(datas: datas))*(data - mean(datas: datas)))
    }
    return sum/Float(datas.count - 1)
}

func distance(pointA:CGPoint, pointB:CGPoint) -> CGFloat{
    let xDist = pointA.x - pointB.x
    let yDist = pointA.y - pointB.y
    return CGFloat(sqrt((xDist * xDist) + (yDist * yDist)))
}


func distance3D(pointA:SCNVector3, pointB:SCNVector3) -> CGFloat{
    let xDist = pointA.x - pointB.x
    let yDist = pointA.y - pointB.y
    let zDist = pointA.z - pointB.z
    return CGFloat(sqrt((xDist * xDist) + (yDist * yDist) + (zDist * zDist)))
}

func angulus(pointA:CGPoint, pointB:CGPoint, origin:CGPoint) -> Float{
    
    let a = distance(pointA: origin, pointB: pointA)
    let b = distance(pointA: origin, pointB: pointB)
    let c = distance(pointA: pointA, pointB: pointB)
    
    let a2 = CGFloat(pow(Double(a), 2))
    let b2 = CGFloat(pow(Double(b), 2))
    let c2 = CGFloat(pow(Double(c), 2))
    
    let angle = acos((a2 + b2 - c2)/(2*a*b))
    
    return Float(angle)
}

func scaleFactor(rulerA:CGPoint, rulerB:CGPoint, input:Float)->Float{
    let a:Float = Float(distance(pointA: rulerA, pointB: rulerB))
    let scale:Float = a/input
    return scale
    
}

func deg(rad:Float) -> CGFloat {
    return CGFloat(rad) * 180 / CGFloat(M_PI)
}

func rad(deg:Float)-> CGFloat {
    return CGFloat(deg) * CGFloat(M_PI) / 180
}

func drawFromPoint(from:CGPoint, angle:Float, length:Float) -> CGPoint{
    
    let newX = Float(from.x) + length*cos(angle)
    let newY = Float(from.y) + length*sin(angle)
    
    return CGPoint(x: CGFloat(newX), y: CGFloat(newY))
}
