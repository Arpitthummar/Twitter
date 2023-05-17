//
//  TwitterBlueViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 09/05/23.
//

import UIKit

class TwitterBlueViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var subscriptionButton: UIButton!
    @IBOutlet weak var lineLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
   func setUp(){
       if self.revealViewController() != nil {
           backButton.addTarget(self.revealViewController(), action: #selector(self.revealViewController().revealToggle(_:)), for: .touchUpInside)
           self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
       }
       subscriptionButton.layer.masksToBounds = true
       subscriptionButton.layer.cornerRadius = 10
       lineLable.layer.borderColor = UIColor.gray.cgColor
       lineLable.layer.borderWidth = 1
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 1:
            subscriptionButton.setTitle("$84/month", for: .normal)
        default:
            subscriptionButton.setTitle("$114.99/year", for: .normal)
        }
    }
}
