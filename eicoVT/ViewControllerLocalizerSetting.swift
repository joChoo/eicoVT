//
//  ViewControllerLocalizerSetting.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 14/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts


enum SettingMode {
    case creation, edition
}


class ViewControllerLocalizerSetting: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var currentLocalizer:ECLocalizer?
    var settingMode:SettingMode = SettingMode.creation
    
    
    var tableInfosSections:[String] = ["Required informations","Optionnal informations"]
    var tableOptionSections:[String] = ["Options"]
    var footerText:[String] = ["Make the team private to allow access only to restricted users",""]
    
    
    var options:[Any] = []
    var settings:[[LocalizerSetting]] = [[],[]]
    
    
    
    @IBOutlet weak var buttonCancel: UIButton!
    @IBAction func buttonCancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var buttonCreate: UIButton!
   
    @IBAction func buttonCreatePressed(_ sender: Any) {
    
        switch settingMode {
            
        case .creation :
            print("creation mode")
            switch type(of: currentLocalizer){
                case is Nexus.Type:
                    print("nexus")
                    // Team creation
                    checkTeam(settings: settings)
                    
                case is Team.Type:
                    print("team")
                case is Entity.Type:
                    print("entity")
                case is Part.Type:
                    print("part")
                case is Subpart.Type:
                    print("subpart")
                default:
                    print("default")
            }
        case .edition :
            print("edition mode")
            switch type(of: currentLocalizer){
            case is Nexus.Type:
                print("nexus")
            case is Team.Type:
                print("team")
            case is Entity.Type:
                print("entity")
            case is Part.Type:
                print("part")
            case is Subpart.Type:
                print("subpart")
            default:
                print("default")
            }

        }
    }
    
    
    @IBOutlet weak var labelTableInfos: UILabel!
    @IBOutlet weak var tableInfos: UITableView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!

    
    
    @IBOutlet weak var buttonSaveOptions: UIButton!
    @IBAction func buttonSaveOptionsPressed(_ sender: Any) {
    }
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var labelOptions: UILabel!
    @IBOutlet weak var tableOptions: UITableView!
    @IBOutlet weak var segmentControlOptions: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
        
        tableInfos.delegate = self
        tableInfos.dataSource = self
        tableOptions.delegate = self
        tableOptions.dataSource = self

        displayLocalizer(localizer: currentLocalizer!)
        loadInfos(of: currentLocalizer!)
        
        let nibText:UINib = UINib(nibName: "TableViewCellSettingString", bundle: Bundle.main)
        tableInfos.register(nibText, forCellReuseIdentifier: "stringCell")
        
        let nibBool:UINib = UINib(nibName: "TableViewCellSettingBool", bundle: Bundle.main)
        tableInfos.register(nibBool, forCellReuseIdentifier: "boolCell")
        
        let nibList:UINib = UINib(nibName: "TableViewCellSettingList", bundle: Bundle.main)
        tableInfos.register(nibList, forCellReuseIdentifier: "listCell")
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {

        switch tableView {
        case tableInfos:
            return tableInfosSections.count
        case tableOptions:
            return 1
        default:
            return 0
        }
        

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch tableView {
        case tableInfos:
            switch section {
            case 0:
                return settings[0].count
            case 1:
                return settings[1].count
            default:
                return 0
            }

        case tableOptions:
            return options.count
            
        default :
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row in \(tableView) at \(indexPath)")
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        switch tableView {
        case tableInfos:
             return tableInfosSections[section]
        case tableOptions:
            return nil
        default :
            return nil
        }
        

    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView {
        case tableInfos:
            switch ((settings[indexPath.section])[indexPath.row]).type {
            case .text: return 80
            case .bool: return 80
            case .list: return 150
            case .pointer: return 125
            default: return 70
            }
        case tableOptions:
            return 80
        default :
            return 80
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return footerText[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

            switch indexPath.section {
                
            // MANDATORY SECTION
                
            case 0 :
                switch ((settings[0])[indexPath.row]).type {
                case .text:
                    let cell:TableViewCellSettingString = tableView.dequeueReusableCell(withIdentifier: "stringCell", for: indexPath) as! TableViewCellSettingString
                        cell.label.text = "\((settings[0])[indexPath.row].title)"
                    if (settings[0])[indexPath.row].isEditable == false {
                        cell.textfield.isEnabled = false
                    }
                    
                    return cell
                case .bool:
                    let cell:TableViewCellSettingBool = tableView.dequeueReusableCell(withIdentifier: "boolCell", for: indexPath) as! TableViewCellSettingBool
                        cell.labelTitle.text = "\((settings[0])[indexPath.row].title)"
                    if (settings[0])[indexPath.row].isEditable == false {
                        cell.switchBool.isEnabled = false
                    }

                    return cell
                case .list:
                    let cell:TableViewCellSettingList = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! TableViewCellSettingList
                        cell.labelTitle.text = "\((settings[0])[indexPath.row].title)"
                    if (settings[0])[indexPath.row].isEditable == false {
                        cell.buttonAll.isHidden = true
                        // Do not perform segue on touch
                    }

                    return cell
                default :
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                }
            
            
            // FACULTATIVE SECTION
            
            case 1:
                switch ((settings[1])[indexPath.row]).type {
                case .text:
                    let cell:TableViewCellSettingString = tableView.dequeueReusableCell(withIdentifier: "stringCell", for: indexPath) as! TableViewCellSettingString
                        cell.label.text = "\((settings[1])[indexPath.row].title)"
                    return cell
                case .bool:
                    let cell:TableViewCellSettingBool = tableView.dequeueReusableCell(withIdentifier: "boolCell", for: indexPath) as! TableViewCellSettingBool
                    return cell
                case .list:
                    let cell:TableViewCellSettingList = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! TableViewCellSettingList
                    return cell
                default :
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                }

            default :
                let cell:UITableViewCell = UITableViewCell()
                return cell

            }
            
        

        
        
        
    }
    
    func displayLocalizer(localizer:ECLocalizer){
        switch settingMode {
        case .creation :
            switch type(of: localizer){
            case is Nexus.Type:
                labelTitle.text = "Create New Team"
                labelSubtitle.text = "from Nexus"
                labelTableInfos.text = "\(formatDate(date: Date()))"
                buttonCreate.setTitle("Create Team", for: .normal)
            case is Team.Type:
                labelTitle.text = "Create New Entity"
                labelSubtitle.text = "from Team"
                labelTableInfos.text = "Entity : Creation"
                buttonCreate.setTitle("Create Entity", for: .normal)
            case is Entity.Type:
                labelTitle.text = "Create New Part"
                labelSubtitle.text = "from Entity"
                labelTableInfos.text = "Part : Creation"
                buttonCreate.setTitle("Create Part", for: .normal)
            case is Part.Type:
                labelTitle.text = "Create New Subpart"
                labelSubtitle.text = "from Part"
                labelTableInfos.text = "Subpart : Creation"
                buttonCreate.setTitle("Create Subpart", for: .normal)
                
            default: print("unknown localizer type")
            }
            
        case .edition :
            switch type(of: localizer){
            case is Nexus.Type:
                labelTitle.text = "\(localizer.title)"
                labelSubtitle.text = "\(localizer.subtitle)"
                labelTableInfos.text = "Edit settings"
                buttonCreate.setTitle("Save", for: .normal)
            case is Team.Type:
                labelTitle.text = "\(localizer.title)"
                labelSubtitle.text = "\(localizer.subtitle)"
                labelTableInfos.text = "Edit settings"
                buttonCreate.setTitle("Save", for: .normal)
            case is Entity.Type:
                labelTitle.text = "\(localizer.title)"
                labelSubtitle.text = "\(localizer.subtitle)"
                labelTableInfos.text =  "Edit settings"
                buttonCreate.setTitle("Save", for: .normal)
            case is Part.Type:
                labelTitle.text = "\(localizer.title)"
                labelSubtitle.text = "\(localizer.subtitle)"
                labelTableInfos.text = "Edit settings"
                buttonCreate.setTitle("Save", for: .normal)
            case is Subpart.Type:
                labelTitle.text = "\(localizer.title)"
                labelSubtitle.text = "\(localizer.subtitle)"
                labelTableInfos.text = "Edit settings"
                buttonCreate.setTitle("Save", for: .normal)
            default: print("unknown localizer type")
            }
        }
    }
    
    
    
       
    
}
