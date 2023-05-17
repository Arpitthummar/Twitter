//
//  LoginViewController.swift
//  Twitter
//
//  Created by R83 on 17/02/23.
//

import UIKit

class LoginViewController: UIViewController {
    
//MARK: - OUTLETS
    @IBOutlet weak var emialTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgorPassworButton: UIButton!
    @IBOutlet weak var lineLabel: UILabel!
    //MARK: - APP LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius(view: forgorPassworButton, cornerRadius: 15, borderWidth: 0.5)
    }
    
//MARK: - FUNCTIONS
   private func setCornerRadius(view: UIView, cornerRadius: CGFloat,borderWidth: CGFloat){
        view.layer.masksToBounds = true
        view.layer.cornerRadius = cornerRadius
        view.layer.borderWidth = borderWidth
        loginButton.layer.cornerRadius = 15
        forgorPassworButton.layer.borderColor = UIColor.lightGray.cgColor
       lineLabel.layer.borderColor = UIColor.gray.cgColor
       lineLabel.layer.borderWidth = 1
    }
   
  private func setUp(){
        if emialTextField.text == "" && passwordTextField.text == "" {
            displayValidation(massage: LoginValidation.allRequierdValidations)
        }else if emialTextField.text == ""{
            displayValidation(massage: LoginValidation.emptyEmail)
        }else if passwordTextField.text == ""{
            displayValidation(massage: LoginValidation.emptyPassword)
        }
    }
    
    private func displayValidation(massage: String){
        let alert: UIAlertController = UIAlertController(title: "Error", message: massage, preferredStyle: .alert)
        let okButten: UIAlertAction = UIAlertAction(title: "ok", style: .default)
        let cancelButten: UIAlertAction = UIAlertAction(title: "cancel", style: .destructive)
        alert.addAction(okButten)
        alert.addAction(cancelButten)
        present(alert, animated: true, completion: nil)
    }
    
//MARK: - BUTTON ACTIONS
    @IBAction func loginButtonTab(_ sender: UIButton) {
        setUp()
        let tabBarViewController = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        navigationController?.pushViewController(tabBarViewController, animated: true)
    }
    @IBAction func forgotButtonTab(_ sender: UIButton){
        let forgotPasswordViewController = storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        navigationController?.pushViewController(forgotPasswordViewController, animated: true)
    }
}

