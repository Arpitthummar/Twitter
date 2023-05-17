//
//  TopicsViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 09/05/23.
//

import UIKit

class TopicsViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var lableTwo: UILabel!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var lineLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setIndex(index: 0)
        setSideMenu()
    }
    private func setSideMenu() {
        if self.revealViewController() != nil {
            backButton.addTarget(self.revealViewController(), action: #selector(self.revealViewController().revealToggle(_:)), for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    private func setIndex(index: Int){
        switch index{

        case 1:
            labelOne.isHidden = false
            lableTwo.isHidden = true
            
        default:
            labelOne.isHidden = true
            lableTwo.isHidden = false
        }
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        setIndex(index: sender.selectedSegmentIndex)
    }
}
