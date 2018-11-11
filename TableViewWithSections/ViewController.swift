//
//  ViewController.swift
//  TableViewWithSections
//
//  Created by David Lawrence on 11/11/18.
//  Copyright © 2018 clarity for action. All rights reserved.
//

import UIKit

let data = [
    ["London", "Paris", "Berlin"],
    ["Atlanta", "Boston", "Tucson"],
    ["Toronto", "Vancouver", "Montreal"]
]

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    @IBOutlet var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
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
    
            headerView.backgroundColor = UIColor.lightGray
            headerView.headerLabel.text = "Section \(section)"
            return headerView
        }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        print("will display header view")
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cityName = data[indexPath.section][indexPath.row]
        cell.textLabel?.text = "\(cityName)"
        cell.detailTextLabel?.text = "Section: \(indexPath.section) Row: \(indexPath.row)"
        return cell
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //table view data will not appear unless the vc is set as tableview datasource
        tableView.dataSource = self
        
        //delegate methods - such as tableView(_:viewForHeaderInSection:) will not appear
        // unless vc is set as tableView delegate
        tableView.delegate = self
    }
    
    


}

