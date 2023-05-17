//
//  ViewController.swift
//  Twitter
//
//  Created by R&W on 16/02/23.
//

import UIKit

class FirstPageViewController: UIViewController {
  
//MARK: - OUTLETS
    @IBOutlet var labelTwo: UILabel!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTwo.layer.borderWidth = 1
        [googleButton,createAccountButton].forEach {
            setCornerRadius(view: $0, cornerRadius: 15,borderWidth: 0.5)
        }
    }
//MARK: - FUNCTION AND BUTTON ACTIONS
    func setCornerRadius(view: UIView, cornerRadius: CGFloat,borderWidth: CGFloat){
        view.layer.masksToBounds = true
        view.layer.cornerRadius = cornerRadius
        view.layer.borderWidth = borderWidth
    }
    @IBAction func googleButtonTab(_ sender: UIButton) {
        let gooogleViewController = storyboard?.instantiateViewController(withIdentifier: "GooogleViewController") as! GooogleViewController
        navigationController?.pushViewController(gooogleViewController, animated: true)
    }
    
    @IBAction func loginButtonTab(_ sender: UIButton) {
        let loginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction func signUpButtonTab(_ sender: UIButton) {
        let signUpViewController = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
}

