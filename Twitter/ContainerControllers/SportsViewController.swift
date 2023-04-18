//
//  SportsViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 03/03/23.
//

import UIKit

class SportsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrSportsNews: [SportsNews] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        registerSportsCellFile()
        loadSportsNewsData()
    }
    private func registerSportsCellFile(){
        tableView.register(UINib(nibName: "SportsTableViewCell", bundle: nil), forCellReuseIdentifier: "SportsTableViewCell")
        tableView.separatorStyle = .none
    }
    private func loadSportsNewsData(){
        arrSportsNews = [SportsNews( trendingName: "#WeAreBFC", tweets: "Trending with #KerlaBlasters, #benguluruFc"),SportsNews( trendingName: "Azam Khan", tweets: "3.5k Tweets"),SportsNews(trendingName: "#HeroISL", tweets: "1.5k Tweets"),SportsNews(trendingName: "Imad Wasim", tweets: "3.2k Tweets"),SportsNews(trendingName: "#F12023", tweets: "3.5k Tweets"),SportsNews(trendingName: "#CHELEE", tweets: "1.8k Tweets"),SportsNews(trendingName: "Reece James", tweets: "4k Tweets"),SportsNews(trendingName: "Theo Pourchaire", tweets: "1k Tweets")]
    }
}
extension SportsViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSportsNews.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SportsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SportsTableViewCell", for: indexPath) as! SportsTableViewCell
        cell.trendingLabel.text = "Trending in Sports"
        cell.trendingNameLabel.text = arrSportsNews[indexPath.row].trendingName
        cell.tweetLabel.text = arrSportsNews[indexPath.row].tweets
        cell.trendingLabel.textColor = UIColor.darkGray
        cell.trendingNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        cell.tweetLabel.textColor = UIColor.gray
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
struct SportsNews{
    var trendingName: String
    var tweets: String
}
