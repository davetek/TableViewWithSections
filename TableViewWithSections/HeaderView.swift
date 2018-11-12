//
//  HeaderView.swift
//  TableViewWithSections
//
//  Created by David Lawrence on 11/11/18.
//  Copyright © 2018 clarity for action. All rights reserved.
//

import UIKit

class HeaderView: UITableViewCell {
    
    @IBOutlet var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
