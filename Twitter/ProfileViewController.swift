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
    @IBOutlet weak var professionalToolsButton: UIButton!
    @IBOutlet var subButtons: [UIButton]!
    @IBOutlet var subButtonsOfSettings: [UIButton]!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
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
    private func setUpAnimationTwo(){
        subButtonsOfSettings.forEach { buttons in
            UIView.animate(withDuration: 0.3) {
                buttons.isHidden = !buttons.isHidden
                self.view.layoutIfNeeded()
            }
        }
    }
    private func setUpAnimation(){
        subButtons.forEach { buttons in
            UIView.animate(withDuration: 0.3) {
                buttons.isHidden = !buttons.isHidden
                self.view.layoutIfNeeded()
            }
        }
    }
//MARK: - Button Actions
    @IBAction func profileButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "profile", sender: nil)
    }
    
    @IBAction func settingButtonAction(_ sender: UIButton) {
        setUpAnimationTwo()
       if professionalToolsButton.tag == 0 {
            professionalToolsButton.setImage(UIImage(named: "down-arrow"), for: .normal)
           professionalToolsButton.tag = 1
       } else {
           professionalToolsButton.setImage(UIImage(named: "next"), for: .normal)
          professionalToolsButton.tag = 0
       }
    }
    
    @IBAction func professionButtonAction(_ sender: UIButton) {
        setUpAnimation()
       if professionalToolsButton.tag == 0 {
            professionalToolsButton.setImage(UIImage(named: "down-arrow"), for: .normal)
           professionalToolsButton.tag = 1
       } else {
           professionalToolsButton.setImage(UIImage(named: "next"), for: .normal)
          professionalToolsButton.tag = 0
       }
    }
    
    @IBAction func firstSubButtonTab(_ sender: UIButton) {
        setUpAnimation()
    }
    
    @IBAction func secondSubButtonTab(_ sender: UIButton) {
        setUpAnimation()
    }
    
    @IBAction func firstSubButtonTabOfSettings(_ sender: UIButton) {
        setUpAnimationTwo()
    }
    
    @IBAction func secondSubButtonTabOfSettings(_ sender: UIButton) {
        setUpAnimationTwo()
    }
    
    @IBAction func twitterBlueAction(_ sender: UIButton) {
        performSegue(withIdentifier: "Blue", sender: nil)
    }
    
    @IBAction func topicButtonAction(_ sender: UIButton) {
       performSegue(withIdentifier: "topics", sender: nil)
    }
    
    @IBAction func bookMarkButtonAction(_ sender: UIButton) {
       performSegue(withIdentifier: "book", sender: nil)
    }
    
    @IBAction func listButtonAction(_ sender: UIButton) {
       performSegue(withIdentifier: "list", sender: nil)
    }
    
    @IBAction func twitterCircleButtonACtion(_ sender: UIButton) {
        performSegue(withIdentifier: "circle", sender: nil)
    }
}
