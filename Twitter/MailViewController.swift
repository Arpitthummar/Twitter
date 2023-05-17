//
//  MailViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 26/02/23.
//

import UIKit

class MailViewController: UIViewController {

//MARK: - OUTLETS
    @IBOutlet weak var mailButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
  
    @IBOutlet weak var profileButtonAction: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    private func setUp(){
        mailButton.layer.masksToBounds = true
        mailButton.layer.cornerRadius = 15
        
    }
    @IBAction func settingButtonAction(_ sender: UIButton){
        let mailSettingViewController = storyboard?.instantiateViewController(withIdentifier: "MailSettingViewController") as! MailSettingViewController
        navigationController?.pushViewController(mailSettingViewController, animated: true)
    }

    @IBAction func profileButtonTasb(_ sender: UIButton) {
        let profileViewController = storyboard?.instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
}
