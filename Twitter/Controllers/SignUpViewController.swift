//
//  SignUpViewController.swift
//  Twitter
//
//  Created by R83 on 18/02/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
//MARK: - OUTLETS
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var nextButtonTab: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFunctions()
    }
//MARK: - BUTTON ACTION
    @IBAction func nextButtonAction(_ sender: UIButton) {
        setUp()
        let chooseCategoryViewController = storyboard?.instantiateViewController(withIdentifier: "ChooseCategoryViewController") as! ChooseCategoryViewController
        navigationController?.pushViewController(chooseCategoryViewController, animated: true)
    }
//MARK: - FUNCTIONS
    private func loadFunctions(){
        setDatePicker()
        dateOfBirthTextField.delegate = self
        datePicker.isHidden = true
        setCornerRadius(view: nextButtonTab, radius: 15)
    }
    private func setUp(){
        if userNameTextField.text == "" && emailTextField.text == "" && passwordTextfield.text == "" && dateOfBirthTextField.text == ""{
            displayValidation(massage: SignUpValidation.allRequierdValidations)
        }else if userNameTextField.text == "" {
            displayValidation(massage: SignUpValidation.emptyUserName)
        }else if emailTextField.text == "" {
            displayValidation(massage: SignUpValidation.emptyEmail)
        }else if passwordTextfield.text == "" {
            displayValidation(massage: SignUpValidation.emptyPassword)
        }else if dateOfBirthTextField.text == "" {
            displayValidation(massage: SignUpValidation.emptyDateOfBirth)
        }else if passwordTextfield.text?.count ?? 0 < 5 {
            displayValidation(massage: SignUpValidation.shortPassword)
        }else if userNameTextField.text?.count ?? 0 < 5{
            displayValidation(massage: SignUpValidation.invalidUserName)
        }
    }
    func setCornerRadius(view: UIView,radius: CGFloat){
        view.layer.masksToBounds = true
        view.layer.cornerRadius = radius
    }
    private func displayValidation(massage: String){
        let alert: UIAlertController = UIAlertController(title: "Error", message: massage, preferredStyle: .alert)
        let okButten: UIAlertAction = UIAlertAction(title: "ok", style: .default)
        let cancelButten: UIAlertAction = UIAlertAction(title: "cancel", style: .destructive)
        alert.addAction(okButten)
        alert.addAction(cancelButten)
        present(alert, animated: true, completion: nil)
    }
    private func setDatePicker(){
        datePicker.addTarget(self, action: #selector(setDate), for: .valueChanged)
    }
    @objc
    func setDate(){
        let dateFormate = DateFormatter()
        dateFormate.dateStyle = .medium
        dateFormate.timeStyle = .none
        let date = dateFormate.string(from: datePicker.date)
        dateOfBirthTextField.text = date
    }
}
//MARK: - TEXTFIELD DELEGATE METHODS
extension SignUpViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        datePicker.isHidden = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        datePicker.isHidden = true
    }
}
