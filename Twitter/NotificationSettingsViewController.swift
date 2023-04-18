//
//  NotificationSettingsViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 09/03/23.
//

import UIKit

class NotificationSettingsViewController: UIViewController {
    
    @IBOutlet weak var lineLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    private func setUp(){
        lineLabel.layer.borderWidth = 1
        lineLabel.layer.borderColor = UIColor.gray.cgColor
    }
}
