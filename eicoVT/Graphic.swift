//
//  Graphic chart.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 20/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit




// ==================================================================

enum DesignPreference {
    case light, dark
}

enum ColorChart {
    case background, text, lightText, boldText, highlight, alert
}

enum FontSize {
    case body, h1, h2, h3, h4, legend
}


// ==================================================================


func stylizeTable(table:UITableView){
    
}

func stylieTextField(textField:UITextField){
    
}

func stylizeButton(button:UIButton){

}

func stylizeLabel(label:UILabel){
    label.backgroundColor = UIColor.clear
    label.highlightedTextColor = UIColor.black
    label.font = UIFont(name: "", size: 12)
    
}
