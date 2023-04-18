//
//  NewsViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 03/03/23.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrOfNews: [NewsSection] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNewsXibFile()
        loadDataOfNews()
    }
    private func registerNewsXibFile(){
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        tableView.separatorStyle = .none
    }
    private func loadDataOfNews(){
        arrOfNews = [NewsSection(trending: "Trending in Technology", trendingNews: "#iPhone", tweets: "6.6k Tweets"),NewsSection(trending: "Trending in Politics", trendingNews: "#RahulGandhiinCambridge", tweets: "14k Tweets"),NewsSection(trending: "Trending in Politics", trendingNews: "Bakhmut", tweets: "61.4k Tweets"),NewsSection(trending: "Trending", trendingNews: "Banks", tweets: "&4k Tweets"),NewsSection(trending: "Trending in Politics", trendingNews: "jim Jordan", tweets: "79.7k Tweets"),NewsSection(trending: "Trending in News", trendingNews: "David Hundeyin", tweets: "29.8k Tweets"),NewsSection(trending: "Trending in Bussiness & Finance", trendingNews: "#Etherium", tweets: "3.5k Tweets"),NewsSection(trending: "Trending in News", trendingNews: "Success", tweets: "196k Tweets"),NewsSection(trending: "Trending in Bussines & Finance", trendingNews: "Vitalik", tweets: "1.5k Tweets")]
    }
}
extension NewsViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfNews.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.trendingLabel.text = arrOfNews[indexPath.row].trending
        cell.trendingNameLabel.text = arrOfNews[indexPath.row].trendingNews
        cell.tweetLabel.text = arrOfNews[indexPath.row].tweets
        cell.trendingLabel.textColor = UIColor.darkGray
        cell.trendingNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        cell.tweetLabel.textColor = UIColor.gray
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

struct NewsSection {
    var trending: String
    var trendingNews: String
    var tweets: String
}
