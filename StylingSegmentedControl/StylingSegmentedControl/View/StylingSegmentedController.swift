//
//  StylingSegmentedController.swift
//  StylingSegmentedControl
//
//  Created by YAUHENI IVANIUK on 12/18/17.
//  Copyright © 2017 YAUHENI IVANIUK. All rights reserved.
//

import Foundation

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
        
        self.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), NSAttributedStringKey.foregroundColor: UIColor.lightGray], for: .normal)
        let blueColor = UIColor.init(red: 90, green: 200, blue: 250)
        self.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: blueColor], for: .selected)
    }
    
}

extension UISegmentedControl {
    func setLabelColor(){
        let buttonBar = UIView()
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        switch selectedSegmentIndex {
        case 0:
            setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.init(red: 90, green: 200, blue: 250)], for: .selected)
        case 1:
            setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.init(red: 76, green: 217, blue: 100)] , for: .selected)
        case 2:
            setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.init(red: 255, green: 204, blue: 0)], for: .selected)
        case 3:
            setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.init(red: 255, green: 59, blue: 48)], for: .selected)
            
        default:
            break
            
        }
    }
    
    
}

extension UIColor{
    
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    
}
