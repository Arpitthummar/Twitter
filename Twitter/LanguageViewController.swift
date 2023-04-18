//
//  LanguageViewController.swift
//  Twitter
//
//  Created by R83 on 20/02/23.
//

import UIKit

class LanguageViewController: UIViewController {

//MARK: - OUTLETS AND VARIABLES
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
        var selectedIndex: Int = -1
    var arrLanguage: [String] = ["English","Bangla","Gujarati","Hindi","Kannada","Malayalam","Marathi","Nepali","Punjabi","Urdu","Chinese"]
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 15
        ragisterTableViewCell()
    }
//MARK: - FUNCTION AND BUTTON ACTION
    func ragisterTableViewCell(){
        tableView.register(UINib(nibName: "LanguageTableViewCell", bundle: nil), forCellReuseIdentifier: "LanguageTableViewCell")
        tableView.separatorStyle = .none
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        let followViewController = storyboard?.instantiateViewController(withIdentifier: "FollowViewController") as! FollowViewController
        navigationController?.pushViewController(followViewController, animated: true)
    }
}
//MARK: - TABLEVIEW METHODS
extension LanguageViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrLanguage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LanguageTableViewCell
        cell.selectionStyle = .none
        cell.languageLable.text = arrLanguage[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 50 }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
   
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
