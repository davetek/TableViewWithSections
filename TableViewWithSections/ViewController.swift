//
//  ViewController.swift
//  TableViewWithSections
//
//  Created by David Lawrence on 11/11/18.
//  Copyright © 2018 clarity for action. All rights reserved.
//

import UIKit

struct cellData {
    var region = String()
    var cities = [String]()
}




class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    @IBOutlet var tableView: UITableView!
    
    var tableViewData = [cellData]()
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //table view data will not appear unless the vc is set as tableview datasource
        tableView.dataSource = self
        
        //delegate methods - such as tableView(_:viewForHeaderInSection:) will not appear
        // unless vc is set as tableView delegate
        tableView.delegate = self
        
        tableViewData = [
            cellData(region: "Europe", cities: ["London", "Paris", "Berlin"]),
            cellData(region: "United States", cities: ["Atlanta", "Boston", "Tucson"]),
            cellData(region: "Canada", cities: ["Toronto", "Vancouver", "Montreal"])
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
        
        //add the ability to recognize when the view for the header section is tapped
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(sectionHeaderTapped(sender:)))
        headerView.addGestureRecognizer(tapGesture)
        headerView.isUserInteractionEnabled = true
        
        //set the appearance of the header view
        headerView.backgroundColor = UIColor.lightGray
        let region = tableViewData[section].region
        headerView.headerLabel.text = region
        
        return headerView
    }
    
    //function called when the custom section header view recognizes a tap gesture
    @objc func sectionHeaderTapped(sender: UIGestureRecognizer) {
        print("tapped")
    }
    
////    @objc func tapGestureRecognizer(gestureRecognizer: UIGestureRecognizer) {
////        print("tapped")
//    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        print("will display header view")
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData[section].cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cityName = tableViewData[indexPath.section].cities[indexPath.row]
        cell.textLabel?.text = "\(cityName)"
        cell.detailTextLabel?.text = "Section: \(indexPath.section) Row: \(indexPath.row)"
        return cell
    }
    

    
    

    
    


}

