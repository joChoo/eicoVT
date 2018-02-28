//
//  ViewControllerSubclass.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 05/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit

class ViewControllerSubclass: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    //==============================================================================
    // OUTLETS
    //==============================================================================
    
    
    
    
    
    
    //==============================================================================
    // TABLES DATASOURCE
    //==============================================================================
    

     // Navigation Table
     // Datas Table
    
    
    
    
    
    //==============================================================================
    // CONTROL
    //==============================================================================
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set delegates and datasources for tableviews
        
        
        
        
        // Import & register the nib files
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Tables delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell()
        return cell
    }
    
    
    
    //==============================================================================
    // METHODS
    //==============================================================================
    

}
