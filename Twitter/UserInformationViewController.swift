//
//  UserInformationViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 27/03/23.
//

import UIKit

class UserInformationViewController: UIViewController {
//MARK: -  OUTLETS
    @IBOutlet weak var lineLabel: UILabel!
//MARK: - APP LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
      setUp()
        // Do any additional setup after loading the view.
    }
//MARK: - FUNCTIONS
    private func setUp(){
        lineLabel.layer.borderColor = UIColor.gray.cgColor
        lineLabel.layer.borderWidth = 1
    }

}
