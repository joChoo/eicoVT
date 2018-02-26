//
//  TableViewCellSearch.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 02/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit

class TableViewCellSearch: UITableViewCell {

    @IBOutlet weak var buttonAdd: UIButton!
    @IBAction func buttonAddPressed(_ sender: Any) {
    }
    @IBOutlet weak var labelType: UILabel!

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
