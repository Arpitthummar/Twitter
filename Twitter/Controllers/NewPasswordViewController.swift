//
//  NewPasswordViewController.swift
//  Twitter
//
//  Created by R83 on 18/02/23.
//

import UIKit

class NewPasswordViewController: UIViewController {
//MARK: - OUTLETS
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var newPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius(view: nextButton, radius: 15)
    }
    private func setUp(){
        if newPasswordTextField.text == "" && confirmPasswordTextField.text == "" {
            displayValidation(massage: PasswordValidation.emptyTextField)
        } else if newPasswordTextField.text == "" {
            displayValidation(massage: PasswordValidation.emptyPassword)
        } else if confirmPasswordTextField.text == "" {
            displayValidation(massage: PasswordValidation.emptyConfirmPassword)
        } else if newPasswordTextField.text?.count ?? 0 < 5 {
            displayValidation(massage: PasswordValidation.shortPassword)
        } else if newPasswordTextField.text != confirmPasswordTextField.text{
            displayValidation(massage: PasswordValidation.passwordIsNotSame)
        }
    }
    @IBAction func nextButtonTab(_ sender: UIButton) {
        let loginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    func setCornerRadius(view: UIView,radius: CGFloat){
        view.layer.masksToBounds = true
        view.layer.cornerRadius = radius
        lineLabel.layer.borderColor = UIColor.gray.cgColor
        lineLabel.layer.borderWidth = 1
    }
    private func displayValidation(massage: String){
        let alert: UIAlertController = UIAlertController(title: "Error", message: massage, preferredStyle: .alert)
        let okButten: UIAlertAction = UIAlertAction(title: "ok", style: .default)
        let cancelButten: UIAlertAction = UIAlertAction(title: "cancel", style: .destructive)
        alert.addAction(okButten)
        alert.addAction(cancelButten)
        present(alert, animated: true, completion: nil)
    }
}
