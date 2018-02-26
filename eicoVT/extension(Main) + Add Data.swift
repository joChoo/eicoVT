//
//  extension - VCMain Add.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 06/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts



extension ViewControllerMain {
    
    func submitComment(){
        
        let content:String = textviewComment.text
        let newComment:Comment = Comment(author: "\((connectedUser!.value(forKey: "firstName") as!String).capitalized) \((connectedUser!.value(forKey: "lastName") as!String).uppercased())", content: content, date: Date())
        
        
        
        
        
        
        let commentPF:PFObject = PFObject(className: "Comment")
                commentPF.setObject(newComment.content, forKey: "content")
                commentPF.setObject(connectedUser, forKey: "author")
                commentPF.setObject(newComment.date, forKey: "date")
    
            commentPF.saveInBackground { (succeeded, error) in
                if succeeded {
                    print("comment has been saved")
                }
                else {
                    commentPF.saveEventually()
                }
        }
        
        /*
         
         let player = PFObject(className: "Player")
         player.setObject("John", forKey: "Name")
         player.setObject(1230, forKey: "Score")
         player.saveInBackgroundWithBlock { (succeeded, error) -> Void in
         if succeeded {
         println("Object Uploaded")
         } else {
         println("Error: \(error) \(error.userInfo!)")
         }
         }
         */
        
    }
    
    
    func createRecord(){
        
        let newRecord = Record(title: "", author: "", value: 12, date: Date())
        
        let newPFRecord = PFObject(className: "Record")
        newPFRecord.setObject("", forKey: "value")
        
    }


    
}
