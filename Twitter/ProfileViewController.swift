//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 26/02/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
//MARK: - OUTLETS
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var lineLabelTwo: UILabel!
    @IBOutlet weak var settingButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
//MARK: - FUNCTION
    private func setUp(){
        settingButton.layer.masksToBounds = true
        settingButton.layer.cornerRadius = 10
        lineLabel.layer.borderWidth = 1
        lineLabel.layer.borderColor = UIColor.lightGray.cgColor
        lineLabelTwo.layer.borderWidth = 1
        lineLabelTwo.layer.borderColor = UIColor.lightGray.cgColor
    }
    @IBAction func profileButtonAction(_ sender: UIButton) {
        let userProfileViewController = storyboard?.instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
        navigationController?.pushViewController(userProfileViewController, animated: true)
    }
    
    @IBAction func settingButtonAction(_ sender: UIButton) {
        
    }
}
