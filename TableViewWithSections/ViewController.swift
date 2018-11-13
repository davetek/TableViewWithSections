//
//  ViewController.swift
//  TableViewWithSections
//
//  Created by David Lawrence on 11/11/18.
//  Copyright © 2018 clarity for action. All rights reserved.
//

import UIKit

struct sectionData {
    var expanded = Bool()
    var region = String()
    var cities = [String]()
}




class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    @IBOutlet var tableView: UITableView!
    
    var tableViewData = [sectionData]()
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //table view data will not appear unless the vc is set as tableview datasource
        tableView.dataSource = self
        
        //delegate methods - such as tableView(_:viewForHeaderInSection:) will not appear
        // unless vc is set as tableView delegate
        tableView.delegate = self
        
        tableViewData = [
            sectionData(expanded: true, region: "Europe", cities: ["London", "Paris", "Berlin"]),
            sectionData(expanded: true, region: "United States", cities: ["Atlanta", "Boston", "Tucson"]),
            sectionData(expanded: true, region: "Canada", cities: ["Toronto", "Vancouver", "Montreal"])
        ]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "SECTION \(section)"
//    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let label = UILabel()
//        label.text = "Header"
//        label.backgroundColor = UIColor.lightGray
//        return label
//    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as! HeaderView
        
        //set the appearance of the header view
        headerView.backgroundColor = UIColor.lightGray
        let region = tableViewData[section].region
        headerView.headerLabel.text = region
        
        //set the tag property of the headerView to the value of the section number
        headerView.tag = section
        
        //enable user interaction for the headerView, so it can recognize gestures
        headerView.isUserInteractionEnabled = true
        
        //add the ability to recognize when the view for the header section is tapped
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(sectionHeaderTapped(sender:)))
        headerView.addGestureRecognizer(tapGesture)
        
        return headerView
    }
    
    //function called when the custom section header view recognizes a tap gesture
    // identifies the section tapped using the tag assigned to the headerView
    // and then changes the value of the 'expanded' property for that section
    // and then reloads the table view
    @objc func sectionHeaderTapped(sender: UIGestureRecognizer) {
        if let sectionTapped = sender.view?.tag {
            print("section \(sectionTapped) tapped")
            if tableViewData[sectionTapped].expanded == true {
                tableViewData[sectionTapped].expanded = false
            } else {
                tableViewData[sectionTapped].expanded = true
            }
            tableView.reloadData()
        }
    }
    
////    @objc func tapGestureRecognizer(gestureRecognizer: UIGestureRecognizer) {
////        print("tapped")
//    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //do something
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].expanded == true {
            return tableViewData[section].cities.count
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cityName = tableViewData[indexPath.section].cities[indexPath.row]
        cell.textLabel?.text = "\(cityName)"
        cell.detailTextLabel?.text = "Section: \(indexPath.section) Row: \(indexPath.row)"
        return cell
    }
    

    
    

    
    


}

