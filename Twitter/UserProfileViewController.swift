//
//  UserProfileViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 13/03/23.
//

import UIKit

class UserProfileViewController: UIViewController {

// MARK: - Outlets 
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var suggetionContainer: UIView!
    @IBOutlet weak var mediaContainer: UIView!
    @IBOutlet weak var likesContainer: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editProfileButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .systemCyan
        handleContainerViewBasedOnSelection(index: 0)
       setUp()
    }
    private func setUp(){
        if self.revealViewController() != nil {
            backButton.addTarget(self.revealViewController(), action: #selector(self.revealViewController().revealToggle(_:)), for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 45
    }
    
    private func handleContainerViewBasedOnSelection(index: Int) {
        switch index {
        case 0:
            suggetionContainer.isHidden = true
            mediaContainer.isHidden = false
            likesContainer.isHidden = true
        case 1:
            suggetionContainer.isHidden = true
            mediaContainer.isHidden = false
            likesContainer.isHidden = true
        case 2:
            suggetionContainer.isHidden = false
            mediaContainer.isHidden = true
            likesContainer.isHidden = true
        case 3:
            suggetionContainer.isHidden = true
            mediaContainer.isHidden = true
            likesContainer.isHidden = false
        default: break
        }
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        handleContainerViewBasedOnSelection(index: sender.selectedSegmentIndex)
    }
    
    @IBAction func profileButtonAction(_ sender: UIButton){}
}
