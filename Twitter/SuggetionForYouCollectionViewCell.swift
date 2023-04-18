//
//  SuggetionForYouCollectionViewCell.swift
//  Twitter
//
//  Created by Arpit Thummar on 16/03/23.
//

import UIKit

class SuggetionForYouCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var UserProfileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var subNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        followButton.layer.masksToBounds = true
        followButton.layer.cornerRadius = 15
        followButton.layer.borderWidth = 1
        UserProfileImageView.layer.masksToBounds = true
        UserProfileImageView.layer.cornerRadius = 40
        // Initialization code
    }

    @IBAction func followButtonAction(_ sender: UIButton) {
        if followButton.tag == 0{
            followButton.backgroundColor = UIColor.white
            followButton.setTitleColor(.black, for: .normal)
            followButton.layer.borderColor = UIColor.systemGray.cgColor
            followButton.setTitle("Following", for: .normal)
            followButton.tag = 1
        }else{
            followButton.backgroundColor = UIColor.black
            followButton.setTitleColor(.white, for: .normal)
            followButton.layer.borderColor = UIColor.clear.cgColor
            followButton.setTitle("Follow", for: .normal)
            followButton.tag = 0
        }
    }
}
