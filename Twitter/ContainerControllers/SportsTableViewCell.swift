//
//  SportsTableViewCell.swift
//  Twitter
//
//  Created by Arpit Thummar on 03/03/23.
//

import UIKit

class SportsTableViewCell: UITableViewCell {

    @IBOutlet weak var trendingLabel: UILabel!
    @IBOutlet weak var trendingNameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
