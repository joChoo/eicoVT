//
//  ViewControllerMain.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 05/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts


class ViewControllerMain: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //==============================================================================
    // OUTLETS
    //==============================================================================
    
    @IBOutlet weak var buttonLocalizer: UIButton!
    @IBOutlet weak var buttonNewLocalizer: UIButton!
    @IBOutlet weak var buttonUser: UIButton!
    @IBOutlet weak var buttonNewData: UIButton!
    @IBOutlet weak var buttonImport: UIButton!
    
    @IBOutlet weak var labelLocalizerSubtitle: UILabel!
    @IBOutlet weak var labelLocalizerDescription: UILabel!
    @IBOutlet weak var labelTableDatasTitle: UILabel!
    
    @IBOutlet weak var tableNavigation: UITableView!
    @IBOutlet weak var tableDatas: UITableView!
    
    @IBOutlet weak var textviewComment: UITextView!
    @IBOutlet weak var textfieldSearch: UITextField!

    //==============================================================================
    // TABLES DATASOURCE
    //==============================================================================
    
    var currentLocalizer:ECLocalizer = Nexus()
    
    
    // Navigation Table
    
    var navSections:[String] = ["Parent", "Brothers", "Children"]
    var navigationLists:[[ECLocalizer]] = [[],[],[]]
    
    // Datas Table
    
    var datasSections:[String] = ["Alert","Watch","datasList"] // watch - lookout - oversight - control - guard
    var datasLists:[[ECData]] = [[],[],[]]
    
    
    //==============================================================================
    // CONTROL
    //==============================================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        initUI()
        

        
    }
    
    
    func initData(){
        
        if currentLocalizer == nil {
            currentLocalizer = Nexus()
        }
        
        // Import datas
        //queryRecords()
        queryLocalizer(localizer: currentLocalizer)

    }
    
    func initUI(){
        // Set delegates and datasources for tableviews
        
        tableDatas.delegate = self
        tableNavigation.delegate = self
        
        tableDatas.dataSource = self
        tableNavigation.dataSource = self
        
        loadNibFiles(of: currentLocalizer)
        localizerNeedsDisplay()


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // Tables delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch tableView {
        case tableDatas :
            
            // If there is no datas => display a NO DATAS background
            if datasLists[2].count == 0 {
                let noDatasLabel:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height))
                noDatasLabel.text = "NO DATAS"
                noDatasLabel.textColor = UIColor.darkGray
                noDatasLabel.textAlignment = .center
                tableView.backgroundView  = noDatasLabel
                tableView.separatorStyle  = .none
                return 1
            }
            else {
                return 3
            }
        case tableNavigation:
            return 3
            
        default:
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch tableView {
        case tableDatas:
            if datasLists[2].count != 0 {
                return datasSections[section]}
            else {
                return nil
            }
        case tableNavigation:
            return navSections[section]
        default : return nil
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case tableNavigation:
            return navigationLists[section].count
        case tableDatas:
            return datasLists[section].count
        default : return 0
        }
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case tableNavigation:
            print("didSelectRow -> selected localizer : \((navigationLists[indexPath.section])[indexPath.row])")
            currentLocalizer = (navigationLists[indexPath.section])[indexPath.row]
            clearTables()
            queryLocalizer(localizer: currentLocalizer)
            localizerNeedsDisplay()
            
            
            
        case tableDatas:
            print("didSelectRow -> selected data : \((datasLists[indexPath.section])[indexPath.row])")
        default :
            print("didSelectRow -> unknown table selected")
        }
    }
    
    
    //==============================================================================
    // METHODS
    //==============================================================================
    
    
    
    
    func localizerNeedsDisplay(){
        print("func: localizerNeedsDisplay() - in ViewControllerMain")
        self.buttonLocalizer.setTitle(currentLocalizer.title, for: .normal)
        self.labelLocalizerSubtitle.text = currentLocalizer.description
        self.labelLocalizerDescription.text = currentLocalizer.subtitle
        self.tableDatas.reloadData()
        self.tableNavigation.reloadData()
        
        switch type(of: currentLocalizer){
        case is Nexus.Type:
            self.textfieldSearch.placeholder = "Search and Add"
            self.buttonNewData.setTitle("New question", for: .normal)
            self.buttonNewLocalizer.setTitle("+ Team", for: .normal)
            self.navSections = ["","Entity templates","Teams"]
            self.datasSections = ["Incoming events","Projects in progress","All"]
        case is Team.Type:
            self.textfieldSearch.placeholder = "Search and Add"
            self.buttonNewData.setTitle("New event", for: .normal)
            self.buttonNewLocalizer.setTitle("+ Entity", for: .normal)
            self.navSections = ["Community","Teams","Entities"]
            self.datasSections = ["Incoming events","Projects in progress","All"]
        case is Entity.Type:
            self.textfieldSearch.placeholder = "Search and Add"
            self.buttonNewData.setTitle("New diagnosis", for: .normal)
            self.buttonNewLocalizer.setTitle("+ Part", for: .normal)
            self.navSections = ["Related Teams","Related Entities","Components"]
            self.datasSections = ["","",""]
        case is Part.Type:
            self.textfieldSearch.placeholder = "Search and Add"
            self.buttonNewData.setTitle("New semiology", for: .normal)
            self.buttonNewLocalizer.setTitle("+ Subpart", for: .normal)
            self.navSections = ["Parent","Related Parts","Subparts"]
            self.datasSections = ["Alert","Guard - Watch","List"]
        case is Subpart.Type:
            self.textfieldSearch.placeholder = "Search and Add"
            self.buttonNewData.setTitle("New record", for: .normal)
            self.buttonNewLocalizer.setTitle("+ Landmark", for: .normal)
            self.navSections = ["","",""]
            self.datasSections = ["Alert","Guard - Watch","List"]
        default :
            print("ERROR : localizerNeedsDisplay() : unknown type")
        }
        
        
    }
    
    func clearTables(){
        print("func: clearTables() - in ViewControllerMain")
        
        self.navigationLists = [[],[],[]]
        self.datasLists = [[],[],[]]
        tableNavigation.reloadData()
        tableDatas.reloadData()
        
    }
    
    
    @IBAction func buttonImportPressed(_ sender: Any) {
        let alertController = UIAlertController(
            title: "IMPORT FILES",
            message: "What type of data do you import ?",
            preferredStyle: .actionSheet)
        alertController.popoverPresentationController?.sourceRect = buttonImport.frame
        alertController.popoverPresentationController?.sourceView = self.view
        let fileDataButton = UIAlertAction(
            title: "File (.jpg, .stl)",
            style: .default,
            handler: { (action) -> Void in
                print("Import File")
        })
        let rawDataButton = UIAlertAction(
            title: "Raw datas (.csv, .dcm)",
            style: .default,
            handler: { (action) -> Void in
                print("Raw datas")
        })
        let cancelButton = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: { (action) -> Void in
                print("Cancel button tapped")
        })
        alertController.addAction(fileDataButton)
        alertController.addAction(rawDataButton)
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("preparing for segue")
        let nextViewController = segue.destination as? ViewControllerLocalizerSetting
        nextViewController?.currentLocalizer = currentLocalizer
        if segue.identifier == "creationSegue"{
            nextViewController?.settingMode = .creation
        }
        else {
            nextViewController?.settingMode = .edition
        }
    }
}


