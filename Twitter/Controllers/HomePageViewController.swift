//
//  HomePageViewController.swift
//  Twitter
//
//  Created by R&W on 17/02/23.
//

import UIKit
class HomePageViewController: UIViewController {
 
//MARK: - OUTLETS
    @IBOutlet weak var sagmentOne: UISegmentedControl!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var firstContainView: UIView!
    @IBOutlet weak var secondContainView: UIView!
    @IBOutlet weak var profileButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // revealViewController().setFront(self, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      setUp()
        handleContainerViewBasedOnSelection(index: 0)
    }
//MARK: - FUNCTIONS
    private func setUp(){
        if self.revealViewController() != nil {
            profileButton.addTarget(self.revealViewController(), action: #selector(self.revealViewController().revealToggle(_:)), for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        labelOne.layer.borderWidth = 1
        labelOne.layer.borderColor = UIColor.systemGray.cgColor
    }
    private func handleContainerViewBasedOnSelection(index: Int) {
        switch index {
        case 0:
            firstContainView.isHidden = false
            secondContainView.isHidden = true
        case 1:
            firstContainView.isHidden = true
            secondContainView.isHidden = false
        default: break
        }
    }
//MARK: - BUTTON AND SEGMENTEDCONTROL ACTION
    @IBAction func sagmentedAction(_ sender: UISegmentedControl){
        handleContainerViewBasedOnSelection(index: sender.selectedSegmentIndex)
    }
    
    @IBAction func profileButtonActionTab(_ sender: UIButton) {
        //performSegue(withIdentifier: "home", sender: nil)
    }
}

