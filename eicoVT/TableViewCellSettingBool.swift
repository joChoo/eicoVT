//
//  TableViewCellSettingBool.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 14/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit

class TableViewCellSettingBool: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var switchBool: UISwitch!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
