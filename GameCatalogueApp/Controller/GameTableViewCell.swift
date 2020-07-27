//
//  GameTableViewCell.swift
//  GameCatalogueApp
//
//  Created by Haidar Zamzam on 26/07/20.
//  Copyright © 2020 Haidar Zamzam. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var imageGame: UIImageView!
    @IBOutlet weak var titleGame: UILabel!
    @IBOutlet weak var dateGame: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
