//
//  ViewControllerRegister.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 05/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts


class ViewControllerRegister: UIViewController {

    
    
    
    //==============================================================================
    // OUTLETS
    //==============================================================================
    
    

    
    @IBOutlet weak var buttonCancel: UIButton!
    @IBAction func buttonCancelPressed(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textviewSegmentedControl: UITextView!
    @IBOutlet weak var textfieldMail: UITextField!
    @IBOutlet weak var textfieldPassword: UITextField!
    @IBOutlet weak var textfieldRetypePassword: UITextField!
    
    @IBOutlet weak var buttonRegister: UIButton!
 
    @IBAction func segmentControlChanged(_ sender: UISegmentedControl) {
        textviewSegmentedControl.text = segmentDescriptionList[segmentedControl.selectedSegmentIndex]
    }
    
    @IBAction func buttonRegisterPressed(_ sender: Any) {
        submitUser()
        self.dismiss(animated: true, completion: nil)
    }
    
   
    
    var segmentList:[UserType] = [.academic, .clinician]
    var segmentDescriptionList:[String] = ["For students, researchers, or academics. University ID Required.",
                                           "For clinicians that needs to manage patients. Professional ID Required."]

    
    //==============================================================================
    // CONTROL
    //==============================================================================
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelTitle.text =  ""
        
        segmentedControl.setTitle("\(segmentList[0])", forSegmentAt: 0)
        segmentedControl.setTitle("\(segmentList[1])", forSegmentAt: 1)
        textviewSegmentedControl.text = segmentDescriptionList[segmentedControl.selectedSegmentIndex]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //==============================================================================
    // METHODS
    //==============================================================================
    


    
    // 1 - Textfields validation
    
    func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        // There’s some text before the @
        // There’s some text after the @
        // There’s at least 2 alpha characters after @.
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }

    func isValidPassword(testStr:String?) -> Bool {
       
        guard testStr != nil else { return false }
        
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: testStr)
    }
    
    func arePasswordsEqual()->Bool {
        
        if textfieldPassword.text == textfieldRetypePassword.text {
            return true
        }
        else {
            return false
        }
    }
    
    
    func checkBeforeSubmit()->Bool{
        if arePasswordsEqual() == true {
            if (isValidEmail(email: textfieldMail.text!) == true) && (isValidPassword(testStr: textfieldPassword.text!) == true) {
                return true
            }
            else {
                displayAlertIn(
                    vc: self,
                    title: "invalid user informations",
                    message: "Check your register informations and try again",
                    buttonText: "OK")
                return false
            }
        }
        else {
            displayAlertIn(
                vc: self,
                title: "Password mismatch",
                message: "Passwords are mismatching.",
                buttonText: "OK")
            return false
        }
    }

    
    // 2 - Create a prototype and try upload
    
    
    func signUpAttempt(user:ECUser){
        let newUser = PFUser()
        
        newUser.username = user.identifier
        newUser.password = user.password
        newUser.setValue("\(user.type)", forKey: "type")
        
        newUser.signUpInBackground { (succeeded, error) in
            if succeeded {
                print("Sign up succeeded")
                displayAlertIn(vc: self, title: "Registration complete", message: "A mail has been sent to you to confirm your registration so you can connect to your account", buttonText: "OK")
                // perform segue ?
            }
            else if let signupError = error {
                displayAlertIn(
                    vc: self,
                    title: "Unable to register",
                    message: "Try again later",
                    buttonText: "OK")
            }
        }
    }
    
    
    func userPrototype()->ECUser {
        let newUser:ECUser = ECUser(
            identifier: textfieldMail.text!,
            password: textfieldPassword.text!,
            type: segmentList[segmentedControl.selectedSegmentIndex])
        return newUser
    }
    
    func submitUser(){
        if checkBeforeSubmit() == true {
            
            let newUser = userPrototype()
            signUpAttempt(user: newUser)
        }
    }

}


