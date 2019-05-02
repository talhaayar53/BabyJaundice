//
//  SideTableViewCell.swift
//  BabyJaundice
//
//  Created by TALHA AYAR on 12.10.2018.
//  Copyright © 2018 TALHA AYAR. All rights reserved.
//

import UIKit

class SideTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
