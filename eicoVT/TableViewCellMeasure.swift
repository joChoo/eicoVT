//
//  TableViewCellMeasure.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 01/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit

class TableViewCellMeasure: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelCalculationType: UILabel!
    @IBOutlet weak var textViewDescription: UITextView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var labelProgress: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
