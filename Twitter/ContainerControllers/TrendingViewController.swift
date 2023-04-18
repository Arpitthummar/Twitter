//
//  TrendingViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 03/03/23.
//

import UIKit

class TrendingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arrOfTrending: [Trending] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCell()
        loadData()
    }
    
    private func registerTableViewCell(){
        tableView.register(UINib(nibName: "TrendingTableViewCell", bundle: nil), forCellReuseIdentifier: "TrendingTableViewCell")
        tableView.separatorStyle = .none
    }
    private func loadData(){
        arrOfTrending = [Trending(trending: "1. Trending", trendingTweets: "#Chalo_SalaSar", tweets: "4,776 Tweets"),Trending(trending: "2. Trending", trendingTweets: "#TAJonZEE5", tweets: "2,649 Tweets"),Trending(trending: "3. Trending", trendingTweets: "#PathuThalaTeaser", tweets: "30.2k Tweets"),Trending(trending: "4. Trending", trendingTweets: "#PATHAN BIGGEST GROSSER", tweets: "12.8k Tweets"),Trending(trending: "5. Trending", trendingTweets: "#pepsiriseupbaby", tweets: "8.3k Tweets"),Trending(trending: "6. Trending", trendingTweets: "#abaindiaconference", tweets: "2.3k Tweets"),Trending(trending: "7. Trending", trendingTweets: "#Bheem", tweets: "3.2k Tweets"),Trending(trending: "8. Trending", trendingTweets: "#Yuva", tweets: "7.3k Tweets"),Trending(trending: "9. Trending", trendingTweets: "#ToFOUReverlandWithTXT", tweets: "55.8k Tweets"),Trending(trending: "10. Trending", trendingTweets: "#REMOVE SAMJI FROM HP3", tweets: "8.4k Tweets")]
    }
}
extension TrendingViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfTrending.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TrendingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TrendingTableViewCell", for: indexPath) as! TrendingTableViewCell
        cell.trendingLable.text = arrOfTrending[indexPath.row].trending
        cell.trendingNameLabel.text = arrOfTrending[indexPath.row].trendingTweets
        cell.tweetLabel.text = arrOfTrending[indexPath.row].tweets
        cell.trendingLable.textColor = UIColor.darkGray
        cell.trendingNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        cell.tweetLabel.textColor = UIColor.gray
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
struct Trending{
    var trending: String
    var trendingTweets: String
    var tweets: String
}
