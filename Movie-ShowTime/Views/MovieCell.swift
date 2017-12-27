//
//  MovieCell.swift
//  Movie-ShowTime
//
//  Created by Najmul Hasan on 12/25/17.
//  Copyright © 2017 Najmul Hasan. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    //Custom cell for further scalability
    @IBOutlet weak var tileLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
