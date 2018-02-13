//
//  TableViewCell.swift
//  StylingSegmentedControl
//
//  Created by YAUHENI IVANIUK on 2/12/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class CustomColorCell: UITableViewCell {
    
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var colorView: UIView!
    
    func configCell(color: UIColor, colorName: String) {
            self.colorView.backgroundColor = color
            self.colorName.text = colorName
            self.colorName.textColor = color
    }
}
