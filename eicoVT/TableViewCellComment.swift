//
//  TableViewCellComment.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 08/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit

class TableViewCellComment: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var imageAnswers: UIImageView!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var textviewContent: UITextView!
    @IBOutlet weak var labelAnswers: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
