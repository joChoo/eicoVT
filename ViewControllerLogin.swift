//
//  ViewControllerLogin.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 05/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts

class ViewControllerLogin: UIViewController {

    @IBOutlet weak var labelEICO: UILabel!
    @IBOutlet weak var labelEICOSubtitle: UILabel!
    @IBOutlet weak var labelLegend: UILabel!
    
    @IBOutlet weak var textfieldID: UITextField!
    @IBOutlet weak var textfieldPassword: UITextField!
    
    @IBOutlet weak var buttonLogin: UIButton!
    
    @IBAction func buttonLoginPressed(_ sender: Any) {
        if areTextfieldsValids() == true {
            
            loginAttempt(username: textfieldID.text!, password: textfieldPassword.text!)
            
        }
            
        else {
            print("textfields are invalid")
        }

    }
    @IBOutlet weak var buttonRegister: UIButton!
    @IBOutlet weak var buttonForgotPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func areTextfieldsValids()-> Bool{
    
        if textfieldID.text != nil {
            if textfieldPassword.text != nil {
                return true
            }
            else {
                displayAlertIn(vc: self, title: "Incomplete informations", message: "Specifiy a password", buttonText: "OK")
                return false
            }
        }
        else {
            displayAlertIn(vc: self, title: "Incomplete informations", message: "Fill in the text fields", buttonText: "OK")
            return false
        
        }
    
    }
    
    
    func loginAttempt(username:String, password:String){
       PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
        if user != nil {
            
            connectedUser = user!
            print("connection is a success")
            appD.checkStoryboardMode()
        }
        else if let errorInfo = error {
            displayAlertIn(vc: self, title: "Unable to connect", message: errorInfo.localizedDescription, buttonText: "OK")
        }
        }
    }
}
