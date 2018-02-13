//
//  DataService.swift
//  StylingSegmentedControl
//
//  Created by YAUHENI IVANIUK on 2/12/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import Foundation


class DataService {
    static let share = DataService()
    
    private let array = ["Red","Red","Yellow", "Green", "Red","Red", "Yellow","Green", "Yellow", "Yellow","Green", "Yellow"]
    
    func getColorArrayFor(_ color: ColorEnum) -> [String] {
        if color == ColorEnum.All {
            return array
        }
        return getSortedArrayFor(color)
    }
    
    private func getSortedArrayFor(_ color: ColorEnum) -> [String] {
        var tempArray = [String]()
        for colorString in array {
            if colorString == color.rawValue {
                tempArray.append(colorString)
            }
        }
        return tempArray
    }
}

