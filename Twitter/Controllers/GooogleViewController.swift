//
//  GooogleViewController.swift
//  Twitter
//
//  Created by R&W on 16/02/23.
//

import UIKit

class GooogleViewController: UIViewController {
    
//MARK: - OUTLETS
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var imageViewOne: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//MARK: - BUTTON ACTIONS
    @IBAction func loginIdOne(_ sender: UIButton) {
        let loginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction func loginIdTwo(_ sender: UIButton) {
        let loginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}
