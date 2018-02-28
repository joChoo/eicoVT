//
//  ViewControllerForgotPassword.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 05/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts

class ViewControllerForgotPassword: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var buttonSend: UIButton!
    @IBAction func buttonSendPressed(_ sender: Any) {
        if isValidEmail(email: textfield.text) == true {
            resetPassword(email: textfield.text!)
        }
        else {
            displayAlertIn(vc: self, title: "Incomplete request", message: "You need to provide a correct mail adress to access the request form", buttonText: "OK")
        }
    }
    @IBOutlet weak var buttonCancel: UIButton!
    @IBAction func buttonCancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        // There’s some text before the @
        // There’s some text after the @
        // There’s at least 2 alpha characters after @.
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
    
    
    
    
    func resetPassword(email : String){
        
        // convert the email string to lower case
        let emailToLowerCase = email.lowercased()
        // remove any whitespaces before and after the email address
        let emailCleaned = emailToLowerCase.trimmingCharacters(in: NSCharacterSet.whitespaces)
        
        
        PFUser.requestPasswordResetForEmail(inBackground: emailCleaned) { (success, error) in
            if error == nil {
                displayAlertIn(vc: self, title: "Email has been sent", message: "Please check your mails to complete the reset", buttonText: "OK")
                print("a mail has been sent")
            }
            else {
                displayAlertIn(vc: self, title: "ERROR", message: "The request has failed, please try again later", buttonText: "OK")
                print("request failed, try again later")
            }
        }
        
       
    }
    
}
