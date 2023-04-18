//
//  SpacesViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 08/03/23.
//

import UIKit

class SpacesViewController: UIViewController {
   
//MARK: - OUTLETS AND VARIABLES
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var arrHosts: [SpaceHosters] = []
    var numberOfItemInRow: Int = 1
    var interItemSpac: CGFloat = 10
    var arrOfImages: [String] = ["arijit","weeknd"]
    override func viewDidLoad() {
        super.viewDidLoad()
       setUp()
    }
//MARK: - FUNCTIONS
    private func setUp(){
        registerCollectionViewCell()
        loadHostsData()
        lineLabel.layer.borderWidth = 0.5
        lineLabel.layer.borderColor = UIColor.gray.cgColor
    }
    private func registerCollectionViewCell(){
        collectionView.register(UINib(nibName: "SpaceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SpaceCollectionViewCell")
    }
    private func loadHostsData(){
        arrHosts = [SpaceHosters(time: "LIVE", spaceName: "#Deva Deva", hostName: "Arijit Singh", hostBio: "singer",listening: "3.2M listening "),SpaceHosters(time: "10 : 00 PM", spaceName: "#Creepin'", hostName: "The Weeknd", hostBio: "pop artist",listening: "123k listening")]
    }
}
//MARK: - COLLECTIONVIEW METHODS
extension SpacesViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrHosts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SpaceCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpaceCollectionViewCell", for: indexPath) as! SpaceCollectionViewCell
        cell.timeLabel.text = arrHosts[indexPath.row].time
        cell.titalLabelOfSpace.text = arrHosts[indexPath.row].spaceName
        cell.listeningLabel.text = arrHosts[indexPath.row].listening
        cell.hostLabel.text = arrHosts[indexPath.row].hostName
        cell.hostBioLabel.text = arrHosts[indexPath.row].hostBio
        cell.profileImage.image = UIImage(named: arrOfImages[indexPath.row])
        return cell
    }
}
extension SpacesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = CGFloat(numberOfItemInRow+1)*interItemSpac
        let avilableWidth = collectionView.frame.width - spacing
        let cellWidth = avilableWidth / CGFloat(numberOfItemInRow)
        return CGSize(width: cellWidth, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { return 8 }
}
//MARK: - STRUCTURE
struct SpaceHosters{
    var time: String
    var spaceName: String
    var hostName: String
    var hostBio: String
    var listening: String
}
