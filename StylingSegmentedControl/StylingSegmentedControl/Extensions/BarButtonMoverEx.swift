//
//  BarButtonMoverEx.swift
//  StylingSegmentedControl
//
//  Created by YAUHENI IVANIUK on 2/12/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func moveBarButton(color: UIColor, segmentdController: UISegmentedControl) {
        let x = (segmentdController.frame.width / CGFloat(segmentdController.numberOfSegments)) * CGFloat(segmentdController.selectedSegmentIndex)
        let width = segmentdController.frame.width / CGFloat(segmentdController.numberOfSegments)
        let y = segmentdController.frame.maxY 
        self.translatesAutoresizingMaskIntoConstraints = true
        
        UIView.animate(withDuration: 0.3) {
            self.frame = CGRect(x: x, y: y, width: width, height: self.frame.height)
            
        }
        
        self.layer.cornerRadius = self.frame.height / 2
        self.backgroundColor = color
    }
}
