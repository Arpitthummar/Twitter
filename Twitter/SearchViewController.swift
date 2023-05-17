//
//  SearchViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 03/03/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var firstContainer: UIView!
    @IBOutlet weak var secondContainer: UIView!
    @IBOutlet weak var thirdContainer: UIView!
    @IBOutlet weak var fourthContainer: UIView!
    @IBOutlet weak var profileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        handleContainerViewBasedOnSelection(index: 0)
        
    }
    //MARK: - FUNCTION
    private func handleContainerViewBasedOnSelection(index: Int) {
        switch index {
        case 0:
            firstContainer.isHidden = false
            secondContainer.isHidden = true
            thirdContainer.isHidden = true
            fourthContainer.isHidden = true
        case 1:
            firstContainer.isHidden = true
            secondContainer.isHidden = false
            thirdContainer.isHidden = true
            fourthContainer.isHidden = true
        case 2:
            firstContainer.isHidden = true
            secondContainer.isHidden = true
            thirdContainer.isHidden = false
            fourthContainer.isHidden = true
        case 3:
            firstContainer.isHidden = true
            secondContainer.isHidden = true
            thirdContainer.isHidden = true
            fourthContainer.isHidden = false
        default: break
        }
    }
    private func setSideMenu() {
        if self.revealViewController() != nil {
            profileButton.addTarget(self.revealViewController(), action: #selector(self.revealViewController().revealToggle(_:)), for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    //MARK: - BUTTON AND SEGMENTEDCONTROL ACTION
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        handleContainerViewBasedOnSelection(index: sender.selectedSegmentIndex)
    }
    
    @IBAction func settingButtonAction(_ sender: UIButton) {
        let settingViewController = storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        navigationController?.pushViewController(settingViewController, animated: true)
    }
    
    @IBAction func profileButtonAction(_ sender: UIButton) {
        let profileViewController = storyboard?.instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
        navigationController?.pushViewController(profileViewController, animated: true)
    }
}
