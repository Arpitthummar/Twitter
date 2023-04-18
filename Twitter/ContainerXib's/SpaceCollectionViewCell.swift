//
//  SpaceCollectionViewCell.swift
//  Twitter
//
//  Created by Arpit Thummar on 09/03/23.
//

import UIKit

class SpaceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titalLabelOfSpace: UILabel!
    @IBOutlet weak var listeningLabel: UILabel!
    @IBOutlet weak var hostLabel: UILabel!
    @IBOutlet weak var hostBioLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
        override func awakeFromNib() {
        super.awakeFromNib()
            [firstView,backView].forEach{
                setCornerRadius(view: $0, cornerRadius: 15)
            }
    }
    func setCornerRadius(view: UIView, cornerRadius: CGFloat){
        view.layer.masksToBounds = true
        view.layer.cornerRadius = cornerRadius
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 25
    }

}
