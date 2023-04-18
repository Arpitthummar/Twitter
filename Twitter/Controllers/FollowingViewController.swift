//
//  FollowingViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 25/02/23.
//

import UIKit

class FollowingViewController: UIViewController {
  
//MARK: - OUTLETS AND VARIABLES
    @IBOutlet weak var tableView: UITableView!
    var arrUser: [Users] = []
    var arrImages: [String] = ["scout","musk","ratanTata","ronaldo","mortal","virat","weeknd"]
    override func viewDidLoad() {
        super.viewDidLoad()
        registerFollowingTableViewCell()
        loadDataIntoArrUsers()
    }
//MARK: - FUNCTIONS
    private func registerFollowingTableViewCell(){
        tableView.register(UINib(nibName: "FollowingTableViewCell", bundle: nil), forCellReuseIdentifier: "FollowingTableViewCell")
    }
    private func loadDataIntoArrUsers(){
        arrUser = [Users(name: "scOutOP", subName: "@scouttanmay", tweet: "Don't miss today's PlayGround live at 6:30 PM"),
                   Users(name: "Elon Musk", subName: "@elonmusk", tweet: "Aming to roll out ability to reply to individual DMs, use any reaction emoji & encryption later this month"),
                   Users(name: "Ratan N. Tata", subName: "RNTata2000", tweet: "Words cannot describe the deep sense of loss i feel on the passing of my best friend and colleague Mr.R.K. KrishnaKumar. I will always fondly remember the camaraderie we shared both within the group and peersonally"),
                   Users(name: "Cristiano Ronaldo", subName: "@Cristiano", tweet: "Happy to win the February Player of the month award for the Roshn Saudi League.Hopefully the 1st of many! Proud to be part of this team"),
                   Users(name: "Mortal", subName: "Mortal04907880", tweet: "1045 episodes watched in One Piece will be up to date today Never been so excited about how thing will unfold"),
                   Users(name: "Virat Kohli", subName: "@imVkohli", tweet: "The drive to grow with every experience is progress! Making the world a better place one day at a time. What is your story progress?"),
                   Users(name: "The Weeknd", subName: "@theweeknd", tweet: "HBO concert will be the last piece of down FM. ican see the horizon")]
    }
}
//MARK: - TABLEVIEW METHODS
extension FollowingViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUser.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FollowingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FollowingTableViewCell", for: indexPath) as! FollowingTableViewCell
        cell.nameLabel.text = arrUser[indexPath.row].name
        cell.subNameLabel.text = arrUser[indexPath.row].subName
        cell.tweetLabel.text = arrUser[indexPath.row].tweet
        cell.profileImageView.image = UIImage(named: arrImages[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 160 }
}
//MARK: - STRUCTURE
struct Users{
    var name: String
    var subName: String
    var tweet: String
}
