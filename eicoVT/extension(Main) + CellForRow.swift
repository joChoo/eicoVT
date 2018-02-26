//
//  extension(Main) + CellForRow.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 09/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import Foundation
import UIKit
import Parse
import Bolts



extension ViewControllerMain {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView {
            
            
            // ===========================================================
            //  LOCALIZER
            // ===========================================================
            
            
        case tableNavigation :
            let cell:TableViewCellLocalizer = tableView.dequeueReusableCell(withIdentifier: "localizerCell", for: indexPath) as! TableViewCellLocalizer
            cell.imageIcon.image = UIImage()
            cell.imageIcon.backgroundColor = UIColor.lightGray
            
            
            switch type(of: (navigationLists[indexPath.section])[indexPath.row]) {
            case is Nexus.Type:
                cell.labelHeader.text = "N"
                cell.labelTitle.text = "Nexus"
            case is Team.Type:
                cell.labelHeader.text = "T"
                cell.labelTitle.text = "team"
            case is Entity.Type:
                cell.labelHeader.text = "E"
                cell.labelTitle.text = "entity (template)"
            default:
                cell.labelHeader.text = "."
                cell.labelTitle.text = "unknown"
            }
            
            
            
            return cell
            
            
            // ===========================================================
            //  DATA
            // ===========================================================
            
            
        case tableDatas :
            
            switch type(of: currentLocalizer) {
                
                
            // -------------------------------------------------------
            // NEXUS
                
                
            case is Nexus.Type:
                print("nexus")
                
                switch type(of: ((datasLists[indexPath.section])[indexPath.row])){
                case is Comment.Type :
                    print("comment")
                    let cell:TableViewCellComment = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! TableViewCellComment
                    return cell
                    
                case is Agora.Type :
                    print("comment")
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                    
                case is Project.Type :
                    print("comment")
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                    
                default :
                    print("default")
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                    
                }
                
                
                
                
                // -------------------------------------------------------
                // TEAM
                
        
            case is Team.Type:
                print("team")
                switch type(of: ((datasLists[indexPath.section])[indexPath.row])){
                case is Comment.Type :
                    print("comment")
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                    
                case is Agora.Type :
                    print("comment")
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                    
                case is Project.Type :
                    print("comment")
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                    
                default :
                    print("default")
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                    
                }
                
                
                
                
                
                
                // -------------------------------------------------------
                // ENTITY
                
            case is Entity.Type:
                
                switch type(of: ((datasLists[indexPath.section])[indexPath.row])){
                case is Comment.Type :
                    print("comment")
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                    
                case is Record.Type :
                    print("comment")
                    
                    let cell:TableViewCellRecord = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as! TableViewCellRecord
                    cell.labelAuthor.text = "\((((datasLists[indexPath.section])[indexPath.row])as! Record).author)"
                    cell.labelDate.text = "\((((datasLists[indexPath.section])[indexPath.row])as! Record).date)"
                    cell.labelValue.text = "\((((datasLists[indexPath.section])[indexPath.row])as! Record).value)"
                    cell.labelRecordTitle.text = "\((((datasLists[indexPath.section])[indexPath.row])as! Record).title)"
                    return cell
                    
                    
                default :
                    print("default")
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                    
                }
                
                
                
                
                // -------------------------------------------------------
                // PART
                
                
            case is Part.Type:
                
                switch type(of: ((datasLists[indexPath.section])[indexPath.row])){
                case is Comment.Type :
                    print("comment")
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                    
                case is Record.Type :
                    print("comment")
                    let cell:TableViewCellRecord = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as! TableViewCellRecord
                    cell.labelAuthor.text = "\((((datasLists[indexPath.section])[indexPath.row])as! Record).author)"
                    cell.labelDate.text = "\((((datasLists[indexPath.section])[indexPath.row])as! Record).date)"
                    cell.labelValue.text = "\((((datasLists[indexPath.section])[indexPath.row])as! Record).value)"
                    cell.labelRecordTitle.text = "\((((datasLists[indexPath.section])[indexPath.row])as! Record).title)"
                    return cell
                    
                case is Project.Type :
                    print("comment")
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                    
                default :
                    print("default")
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                    
                }
                
                
                // -------------------------------------------------------
                // SUBPART
                
                
            case is Subpart.Type:
                
                switch type(of: ((datasLists[indexPath.section])[indexPath.row])){
                case is Comment.Type :
                    print("comment")
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                    
                case is Record.Type :
                    print("comment")
                    let cell:TableViewCellRecord = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as! TableViewCellRecord
                    cell.labelAuthor.text = "\((((datasLists[indexPath.section])[indexPath.row])as! Record).author)"
                    cell.labelDate.text = "\((((datasLists[indexPath.section])[indexPath.row])as! Record).date)"
                    cell.labelValue.text = "\((((datasLists[indexPath.section])[indexPath.row])as! Record).value)"
                    cell.labelRecordTitle.text = "\((((datasLists[indexPath.section])[indexPath.row])as! Record).title)"
                    return cell
                    
                case is Project.Type :
                    print("comment")
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                    
                default :
                    print("default")
                    let cell:UITableViewCell = UITableViewCell()
                    return cell
                    
                }
                
                
            default:
                print("unknown localizer type : unable to dequeue cell for tableview")
                let cell:UITableViewCell = UITableViewCell()
                return cell
                
            }
        default :
            print("unknown table")
            let cell:UITableViewCell = UITableViewCell()
            return cell
        }
    }
    
}
