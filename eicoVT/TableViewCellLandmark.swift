//
//  TableViewCellLandmark.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 01/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit

class TableViewCellLandmark: UITableViewCell {

    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var buttonClear: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var viewColor: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewColor.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
