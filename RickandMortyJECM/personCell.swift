//
//  personCell.swift
//  RickMorty
//
//  Created by Piñón Ayala Rodrigo  on 08/11/22.
//

import UIKit

class personCell: UITableViewCell {
    
    @IBOutlet var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
