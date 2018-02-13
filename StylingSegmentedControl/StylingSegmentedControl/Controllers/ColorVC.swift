//
//  ViewController.swift
//  StylingSegmentedControl
//
//  Created by YAUHENI IVANIUK on 2/12/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class ColorVC: UIViewController{
    
    @IBOutlet weak var colorTableView: UITableView!
    @IBOutlet weak var colorSegmented: UISegmentedControl!
    @IBOutlet weak var buttonBar: UIView!
    
    var colorEnum = ColorEnum.All
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorTableView.delegate = self
        colorTableView.dataSource = self
        
        setView(color: setMyColor(color: colorEnum))
        
    }
    
    // Setting all views in to selected color
    func setView(color: UIColor) {
        
        self.colorSegmented.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: color], for: .selected)
        self.colorTableView.separatorColor = color
        self.buttonBar.moveBarButton(color: color, segmentdController: self.colorSegmented)
        
        self.colorTableView.reloadData()
    }
    
    //MARK: SetColor
    func setMyColor(color: ColorEnum) -> UIColor{
        switch color {
        case .All:
            return UIColor(red: 90, green: 200, blue: 250)
        case .Red:
            return UIColor(red: 255, green: 59, blue: 48)
        case .Green:
            return UIColor(red: 76, green: 217, blue: 100)
        case .Yellow:
            return UIColor(red: 255, green: 204, blue: 0)
        }
    }
    
    
    @IBAction func colorSegmentedAction(_ sender: Any) {
        guard let title = colorSegmented.titleForSegment(at: colorSegmented.selectedSegmentIndex) else { return }
        colorEnum = ColorEnum(rawValue: title)!
        
        setView(color: setMyColor(color: colorEnum))
    }
    
}


extension ColorVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.share.getColorArrayFor(colorEnum).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as? CustomColorCell else {
            return CustomColorCell()
        }
        
        let currentColorArray = DataService.share.getColorArrayFor(colorEnum)
        cell.configCell(color: setMyColor(color: colorEnum), colorName: currentColorArray[indexPath.row])
        
        return cell
    }
}
