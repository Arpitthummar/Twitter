//
//  UserProfileViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 13/03/23.
//

import UIKit

class UserProfileViewController: UIViewController {

// MARK: - Outlets 
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editProfileButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       setUp()
    }
    private func setUp(){
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 45
    }
    @IBAction func profileButtonAction(_ sender: UIButton){}
}
