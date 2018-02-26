//
//  TableViewCellFile.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 02/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit

class TableViewCellFile: UITableViewCell {

    @IBOutlet weak var imageThumbnail: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
