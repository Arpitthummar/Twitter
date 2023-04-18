//
//  ForgotPasswordViewController.swift
//  Twitter
//
//  Created by R83 on 18/02/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
//MARK: - OUTLETS
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius(view: nextButton, radius: 15)
    }
//MARK: - FUNCTIONS
    func setCornerRadius(view: UIView,radius: CGFloat){
        view.layer.masksToBounds = true
        view.layer.cornerRadius = radius
    }
   
    private func setUp(){
        if userNameTextField.text == ""{
            displayValidation(massage: SignUpValidation.emptyUserName)
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
//MARK: - BUTTON ACTION
    @IBAction func nextButtonTab(_ sender: UIButton) {
        setUp()
        let newPasswordViewController = storyboard?.instantiateViewController(withIdentifier: "NewPasswordViewController") as!
        NewPasswordViewController
        navigationController?.pushViewController(newPasswordViewController, animated: true)
    }
}
