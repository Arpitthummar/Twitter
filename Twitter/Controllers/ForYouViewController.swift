//
//  ForYouViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 25/02/23.
//

import UIKit

class ForYouViewController: UIViewController {
   
//MARK: - OUTLETS AND VARIABLES
    @IBOutlet weak var tableView: UITableView!
    var arrUaer: [User] = []
    var arrOfImage: [String] = ["musk","scout","weeknd","arijit","indianFlag","neymar"]
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        loadDataOfUser()
    }
//MARK: - FUNCTIONS
    private func registerCell(){
        tableView.register(UINib(nibName: "ForYouTableViewCell", bundle: nil), forCellReuseIdentifier: "ForYouTableViewCell")
    }
    private func loadDataOfUser(){
        arrUaer = [User(name: "Elon Musk", subName: "@elonmusk", tweet: "The ability of Twitter advertising to reach the most influential peolpe in the world is often not fully appreciated."),
                   User(name: "scOutOP", subName: "@scouttanmay", tweet: "Extremely Excited for to day's match of @GlobalEsportsIn All the best"),
                   User(name: "The Weeknd", subName: "@theweeknd", tweet: "Due to overwhelming demand, more shows are being added in Latin America. We are also opening up more seats in Europe for fans."),
                   User(name: "Arijit Singh", subName: "@arijitsingh", tweet: "Who knew my song with phoenix will have a choreography and performance like this... INSANE."),
                   User(name: "Sachin Tendulkar", subName: "@Sachin_rt", tweet: "Happy Holi everyone!"),
                   User(name: "Neymar Jr", subName: "@neymarjr", tweet: "THIS IS LAST WEEK TO EMBRACE BOLDNESS IN PUBG, Did you secure my new skins yet?")]
    }
}
//MARK: - TABLEVIEW METHODS
extension ForYouViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUaer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ForYouTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ForYouTableViewCell", for: indexPath) as!  ForYouTableViewCell
        cell.nameLabel.text = arrUaer[indexPath.row].name
        cell.subNameLabel.text = arrUaer[indexPath.row].subName
        cell.tweetLabel.text = arrUaer[indexPath.row].tweet
        cell.profileImageView.image = UIImage(named: arrOfImage[indexPath.row])
        cell.nameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        cell.subNameLabel.textColor = .gray
        return cell
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 160 }
}
//MARK: - STRUCTURE
struct User{
    var name: String
    var subName: String
    var tweet: String
}
