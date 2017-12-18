//
//  ViewController.swift
//  StylingSegmentedControl
//
//  Created by YAUHENI IVANIUK on 12/18/17.
//  Copyright © 2017 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentdControllerOutlet: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    let buttonBar = UIView()
    
    let array = ["Red","Red","Yellow", "Green", "Red","Red", "Yellow","Green", "Yellow", "Yellow","Green", "Yellow"]
    
    var filteredArray = [String]()
    
    var color = UIColor.init(red: 90, green: 200, blue: 250)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.separatorColor = color
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        buttonBar.frame = CGRect(x: setX(), y: segmentdControllerOutlet.frame.maxY, width: self.view.frame.width / CGFloat(segmentdControllerOutlet.numberOfSegments), height: 8)
        buttonBar.backgroundColor = color
        self.view.addSubview(buttonBar)
    }
    
    func setX() -> CGFloat {
        return (segmentdControllerOutlet.frame.width / CGFloat(segmentdControllerOutlet.numberOfSegments)) * CGFloat(segmentdControllerOutlet.selectedSegmentIndex)
    }
    
    func setNewArray(liveColor: String) -> [String] {
        var newArray = [String]()
        for color in array {
            if color.lowercased() == liveColor.lowercased() {
                newArray.append(color)
            }
        }
        return newArray
    }
    
    func setCommonProperties() {
        buttonBar.frame.origin.x = setX()
        buttonBar.backgroundColor = color
        tableView.separatorColor = color
        
    }
    
    func makeFilter() {
        let title = segmentdControllerOutlet.titleForSegment(at: segmentdControllerOutlet.selectedSegmentIndex)
        filteredArray = setNewArray(liveColor: title!)
        tableView.reloadData()
    }
    
    @IBAction func segmentdControllerAction(_ sender: Any) {
        
        segmentdControllerOutlet.setLabelColor()
        
        switch segmentdControllerOutlet.selectedSegmentIndex {
        case 0:
            color = UIColor.init(red: 90, green: 200, blue: 250)
            setCommonProperties()
            tableView.reloadData()
        case 1:
            color = UIColor.init(red: 76, green: 217, blue: 100)
            setCommonProperties()
            makeFilter()
        case 2:
            color = UIColor.init(red: 255, green: 204, blue: 0)
            setCommonProperties()
            makeFilter()
        case 3:
            color = UIColor.init(red: 255, green: 59, blue: 48)
            setCommonProperties()
            makeFilter()
        default:
            break
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentdControllerOutlet.selectedSegmentIndex == 0 {
            return array.count
        } else {
            return filteredArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if segmentdControllerOutlet.selectedSegmentIndex == 0 {
            cell.textLabel?.text = array[indexPath.row]
        } else {
            cell.textLabel?.text = filteredArray[indexPath.row]
        }
        return cell
    }
    
}

