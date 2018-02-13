//
//  RoundedView.swift
//  StylingSegmentedControl
//
//  Created by YAUHENI IVANIUK on 2/12/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class RoundedView: UISegmentedControl {

    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.height / 2
        super.awakeFromNib()
    }

}
