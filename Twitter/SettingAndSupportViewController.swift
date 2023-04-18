//
//  Setting&SupportViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 27/03/23.
//

import UIKit
import Alamofire

class SettingAndSupportViewController: UIViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    var arrOfUserInformation: UserAcountInformation!
    //MARK: - APP LIFE CYLCE
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        getAccountInformation()
    }
    //MARK: - FUNCTIONS
    private func setUp(){
        nameLabel.isHidden = true
        emailLabel.isHidden = true
        passwordLabel.isHidden = true
        accountButton.layer.masksToBounds = true
        accountButton.layer.cornerRadius = 10
        lineLabel.layer.borderWidth = 1
        lineLabel.layer.borderColor = UIColor.gray.cgColor
    }
    private func getAccountInformation(){
        AF.request("https://randomuser.me/api/",method: .get).responseData { response in
            if response.response?.statusCode == 200 {
                guard let apiData = response.data else { return }
                do {
                    self.arrOfUserInformation   = try JSONDecoder().decode(UserAcountInformation.self, from: apiData)
                    print(self.arrOfUserInformation)
                } catch {
                    print(error)
                }
            } else{
                print("error")
            }
        }
    }
    //MARK: - ACCOUNT BUTTON ACTION
    @IBAction func accountButtonAction(_ sender: UIButton) {
        if accountButton.tag == 0{
            accountButton.backgroundColor = .white
            accountButton.setTitle("Account information", for: .normal)
            accountButton.setTitleColor(.black, for: .normal)
            accountButton.layer.borderWidth = 1
            accountButton.tag = 1
        } else {
            accountButton.backgroundColor = .black
            accountButton.setTitleColor(.white, for: .normal)
            accountButton.setTitle("Account information", for: .normal)
            accountButton.layer.borderWidth = 0
            accountButton.tag = 0
        }
    }
}
struct UserAcountInformation: Decodable{
    var results: [Results]
}
struct Results: Decodable {
    var gender: String
    var name: Name
    var email: String
    var login: Login
    var location: Location
}
struct Name: Decodable {
    var firstName: String
    var lastName: String
    private enum CodingKeys: String, CodingKey{
        case firstName = "first" , lastName = "last"
    }
}
struct Location: Decodable {
    var country: String
}
struct Login: Decodable {
    var password: String
}
