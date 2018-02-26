//
//  ViewControllerUserSettings.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 08/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts



class ViewControllerUserSettings: UIViewController {

    @IBOutlet weak var buttonLogout: UIButton!
    @IBAction func buttonLogoutPressed(_ sender: Any) {
        PFUser.logOut()
        connectedUser = nil
        appD.checkStoryboardMode()
        
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

}
