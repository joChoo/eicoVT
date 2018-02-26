//
//  ViewController.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 01/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit

class ViewControllerFile: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var buttonSettings: UIButton!
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var labelFileTitle: UILabel!
    @IBOutlet weak var labelTableTitle: UILabel!
    @IBOutlet weak var tableRecordsInQueue: UITableView!
    
    @IBOutlet weak var tableSearch: UITableView!
    @IBOutlet weak var textFieldSearch: UITextField!
    
    
    
    // ===============================================
    // Tableview datasources
    var landmarksInQueue:[Landmark] = []
    var measuresInQueue:[Measure] = []
   
    // le store contient les Analysis:[Subpart], Landmark:Subpart, Measure:Subpart à ajouter
    var store:[Subpart] = []
    
    // ===============================================
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableRecordsInQueue.delegate = self
        tableRecordsInQueue.dataSource = self
        tableSearch.delegate = self
        tableSearch.dataSource = self
      
        buttonSave.setTitle("Save Records", for: .normal)
        buttonCancel.setTitle("Cancel", for: .normal)
        labelTableTitle.text = "New records"
        
        //let testDatas = generateTestPart()
        //let testStore = generateAnalysisAndSubpartStore()
        //store = testStore
        //splitDatas(part: testDatas)

        //tableRecordsInQueue.isHidden = true
        
        let nibLandmark:UINib = UINib(nibName: "TableViewCellLandmark", bundle: Bundle.main)
        let nibMeasure:UINib = UINib(nibName: "TableViewCellMeasure", bundle: Bundle.main)
        let nibSearch:UINib = UINib(nibName: "TableViewCellSearch", bundle: Bundle.main)
        tableRecordsInQueue.register(nibLandmark, forCellReuseIdentifier: "landmarkCell")
        tableRecordsInQueue.register(nibMeasure, forCellReuseIdentifier: "measureCell")
        tableSearch.register(nibSearch, forCellReuseIdentifier: "searchCell")
        tableRecordsInQueue.estimatedRowHeight = 70
        tableRecordsInQueue.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        
        switch tableView {
        case tableRecordsInQueue: return 2
        case tableSearch: return 2
        default : return 0
        }

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var tableRecordsTitles:[String] = ["Landmarks", "Measurements"]
        var tableSearchTitles:[String] = ["Analysises", "Subparts"]
        
        switch tableView {
        case tableRecordsInQueue:
            return tableRecordsTitles[section]
        case tableSearch:
            return tableSearchTitles[section]
        default : return nil
        }
        
        
       
    }
    
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
       
        switch tableView {
        case tableRecordsInQueue:
            switch section {
            case 0:
                return "Select a landmark and pin its location on the document."
            case 1:
                return "The measurements in queue are automatically calculated as the landmarks's coordinates are being completed"
            default:
                return nil
            }
        case tableSearch:
           return nil
        default : return nil
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case tableRecordsInQueue:
            switch section {
            case 0:
                return landmarksInQueue.count
            case 1:
                return measuresInQueue.count
            default:
                return 0
            }
        case tableSearch:
            switch section {
            case 0:
                return 0
            case 1:
                return store.count
            default:
                return 0
            }
        default : return 0
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        switch tableView {
        case tableRecordsInQueue:
            switch indexPath.section {
            case 0:
                let cell:TableViewCellLandmark = tableView.dequeueReusableCell(withIdentifier: "landmarkCell") as! TableViewCellLandmark
                cell.labelName.text = landmarksInQueue[indexPath.row].name
                
                if landmarksInQueue[indexPath.row].coordinates == nil {
                    cell.labelValue.text = "waiting for input"
                }
                else {
                    cell.labelValue.text = "x:\(landmarksInQueue[indexPath.row].coordinates?.z),y:\(landmarksInQueue[indexPath.row].coordinates?.z),z:\(landmarksInQueue[indexPath.row].coordinates?.z)"}
                return cell
            case 1:
                let cell:TableViewCellMeasure = tableView.dequeueReusableCell(withIdentifier: "measureCell") as! TableViewCellMeasure
                
                return cell
            default :
                let cell:UITableViewCell = UITableViewCell()
                return cell
            }
        
        case tableSearch:
            
             switch type(of: store[indexPath.row]) {
            
             case is Landmark.Type:
                let cell:TableViewCellSearch = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! TableViewCellSearch
                cell.labelName.text = (store[indexPath.row].name)
                cell.labelType.text = "Landmark"
                cell.labelDescription.text = "no description"
                return cell
            
             case is Measure.Type:
                let cell:TableViewCellSearch = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! TableViewCellSearch
                cell.labelName.text = (store[indexPath.row].name)
                cell.labelType.text = "Measure"
                cell.labelDescription.text = "no description"
                return cell
             default:
                let cell:UITableViewCell = UITableViewCell()
                return cell
                print("unknow type")
            }
            
        default :
            let cell: UITableViewCell = UITableViewCell()
            return cell
        }
        
        
        
        
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    func splitDatas(part:Part){
        for subpart in part.subparts {
            
            switch type(of: subpart){
            case is Landmark.Type:
                landmarksInQueue.append(subpart as! Landmark)
            case is Measure.Type :
                measuresInQueue.append(subpart as! Measure)
            default: print("unknown type of subpart")
            }
           
        }
    }
    
    
}

