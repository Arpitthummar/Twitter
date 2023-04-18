//
//  NotificationViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 09/03/23.
//

import UIKit

class NotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
//MARK: - Navigation
    @IBAction func settingButtonAction(_ sender: UIButton) {
        let notificationSettingsViewController = storyboard?.instantiateViewController(withIdentifier: "NotificationSettingsViewController") as! NotificationSettingsViewController
        navigationController?.pushViewController(notificationSettingsViewController, animated: true)
    }
}
