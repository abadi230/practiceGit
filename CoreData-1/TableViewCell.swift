//
//  TableViewCell.swift
//  CoreData-1
//
//  Created by Abdullah Bajaman on 17/01/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
