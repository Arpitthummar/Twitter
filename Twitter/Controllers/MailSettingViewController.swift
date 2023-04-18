//
//  MailSettingViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 09/03/23.
//

import UIKit

class MailSettingViewController: UIViewController {

//MARK: - Outlets
    @IBOutlet weak var firstSwitch: UISwitch!
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var secondSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    private func setUp(){
        lineLabel.layer.borderWidth = 1
        lineLabel.layer.borderColor = UIColor.gray.cgColor
        firstSwitch.onTintColor = .systemCyan
        secondSwitch.onTintColor = .systemCyan
    }
}
