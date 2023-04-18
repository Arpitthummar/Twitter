//
//  EntertainmentViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 03/03/23.
//

import UIKit

class EntertainmentViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arrloadEntertainment: [Entertainment] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        registerEntertainmentTableViewCell()
        loadEntertainmentCellData()
    }
    private func registerEntertainmentTableViewCell(){
        tableView.register(UINib(nibName: "EntertainmentTableViewCell", bundle: nil), forCellReuseIdentifier: "EntertainmentTableViewCell")
        tableView.separatorStyle = .none
    }
    private func loadEntertainmentCellData(){
        arrloadEntertainment = [Entertainment(trending: "Trending in Music", trendingName: "taekook", tweetsCount: "Trending with Naatu, jungkook"),Entertainment(trending: "Trending in Entertainment", trendingName: "Crunchyroll", tweetsCount: "31.7k Tweets"),Entertainment(trending: "Trending in Music", trendingName: "KESHI", tweetsCount: "5.6k Tweets"),Entertainment(trending: "Trending in Entertainment", trendingName: "Indian Cinema", tweetsCount: "9.5k Tweets"),Entertainment(trending: "Trending in Entertaiment", trendingName: "#NawazuddinSiddiqui", tweetsCount: "2.4k tweets"),Entertainment(trending: "Trending in Entertainment", trendingName: "Eren", tweetsCount: "3.9k tweets"),Entertainment(trending: "Trending", trendingName: "#BurberryxBright", tweetsCount: "1.6k Tweets"),Entertainment(trending: "Trending in Music", trendingName: "#TXT_ 4TH_ Anniversary", tweetsCount: "2.9k Tweets")]
    }
}
extension EntertainmentViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrloadEntertainment.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EntertainmentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EntertainmentTableViewCell", for: indexPath) as! EntertainmentTableViewCell
        cell.trendingLabel.text = arrloadEntertainment[indexPath.row].trending
        cell.trendingNameLabel.text = arrloadEntertainment[indexPath.row].trendingName
        cell.tweetLabel.text = arrloadEntertainment[indexPath.row].tweetsCount
        cell.trendingLabel.textColor = UIColor.darkGray
        cell.trendingNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        cell.tweetLabel.textColor = UIColor.gray
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
struct Entertainment{
    var trending: String
    var trendingName: String
    var tweetsCount: String
}
