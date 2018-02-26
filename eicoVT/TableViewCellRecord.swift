//
//  TableViewCellRecord.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 03/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit

class TableViewCellRecord: UITableViewCell {

    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var labelRecordTitle: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var buttonIsVisible: UIButton!
    @IBAction func buttonIsVisiblePressed(_ sender: Any) {
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


