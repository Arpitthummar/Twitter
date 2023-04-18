//
//  SettingViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 06/03/23.
//

import UIKit

class SettingViewController: UIViewController {

//MARK: - OUTLETS
    @IBOutlet weak var massageLabel: UILabel!
    @IBOutlet weak var locationSwitch: UISwitch!
    @IBOutlet weak var lineLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
//MARK: - FUNCTION
    private func setUp(){
        lineLabel.layer.borderWidth = 1
        lineLabel.layer.borderColor = UIColor.gray.cgColor
    }
//MARK: - SWITCH'S ACTION
    @IBAction func locationSwitchAction(_ sender: UISwitch) {
        if sender.isOn{
            massageLabel.text = ""
        }else{
            massageLabel.text = "Explore Location"
        }
    }
}
