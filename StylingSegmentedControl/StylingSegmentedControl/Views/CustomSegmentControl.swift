//
//  CustomSegmentControl.swift
//  StylingSegmentedControl
//
//  Created by YAUHENI IVANIUK on 2/12/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class StylingSegmentedController: UISegmentedControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        self.backgroundColor = .clear
        self.tintColor = .clear
        
        self.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20), NSAttributedStringKey.foregroundColor: UIColor.lightGray], for: .normal)
    }
    
}
