//
//  ViewController.swift
//  Twitter
//
//  Created by R83 on 21/02/23.
//

import UIKit

class FollowViewController: UIViewController {
    
//MARK: - OUTLETS AND VARIABLES
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var followButton: UIButton!
    var arrOfImage: [String] = ["musk","modi","ratanTata","ronaldo","rock","scout"]
    var arrOfProfile: [Profile] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        followButton.layer.cornerRadius = 15
        registerTableViewCell()
        loadProfileData()
    }
//MARK: - FUNCTIONS
    private func registerTableViewCell(){
        tableView.register(UINib(nibName: "FollowOnePersonTableViewCell", bundle: nil), forCellReuseIdentifier: "FollowOnePersonTableViewCell")
    }
     func loadProfileData(){
         arrOfProfile = [Profile(name: "Elon Musk", subName: "@elonmusk", bio: ""),
                         Profile(name: "Narendra Modi", subName: "@narendrammodi", bio: "Prime Minister of India"),
                         Profile(name: "Ratan N. Tata", subName: "@RNTata2000", bio: "Chairman Emeritus, Tata Sons. Chairman, Tata Trust"),
                         Profile(name: "Cristiano Ronaldo", subName: "@Cristiano", bio: "This Privacy Policy addresses the collection and use of personal information - http://cristianoronaldo.com/terms"),
                         Profile(name: "Dwayne Johnson", subName: "@TheRock", bio: "Founder of linktr.ee/therock"),
                         Profile(name: "sc0utOP", subName: "@scouttanmay", bio: "Streamer 🎮 Managed by @8bit_Thug Promotion/Collaboration-bussinessforscout@gmail.com")]
    }
    @IBAction func nextbuttonTab(_ sender: UIButton) {
        let tabBarViewController = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        navigationController?.pushViewController(tabBarViewController, animated: true)
    }
}
//MARK: - TABLEVIEW METHODS
extension FollowViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfProfile.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FollowOnePersonTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FollowOnePersonTableViewCell", for: indexPath) as! FollowOnePersonTableViewCell
        let user = arrOfProfile[indexPath.row]
        cell.nameLabel.text = user.name
        cell.subNameLAbel.text = user.subName
        cell.bioLabel.text = user.bio
        cell.subNameLAbel.textColor = UIColor.systemGray
        cell.nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        cell.profileImageView.image = UIImage(named: arrOfImage[indexPath.row])
        cell.profileImageView.layer.cornerRadius = 40
        cell.profileImageView.layer.masksToBounds = true
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 120 }
}
//MARK: - STUCTURE
struct Profile{
    var name: String
    var subName: String
    var bio: String
}

