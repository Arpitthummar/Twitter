//
//  MailViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 26/02/23.
//

import UIKit

class MailViewController: UIViewController {

//MARK: - OUTLETS
    @IBOutlet weak var mailButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var barButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    private func setUp(){
        mailButton.layer.masksToBounds = true
        mailButton.layer.cornerRadius = 15
        if self.revealViewController() != nil {
            barButton.target = self.revealViewController()
            barButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    @IBAction func settingButtonAction(_ sender: UIButton){
        let mailSettingViewController = storyboard?.instantiateViewController(withIdentifier: "MailSettingViewController") as! MailSettingViewController
        navigationController?.pushViewController(mailSettingViewController, animated: true)
    }

    @IBAction func barButtonAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "mail", sender: nil)
    }
}
