//
//  SuggestionViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 16/03/23.
//

import UIKit

class SuggestionViewController: UIViewController {
    
// MARK: - Outlets and variables
    @IBOutlet var collectionView: UICollectionView!
    var arrOfUsers: [UserInformation] = []
    var arrOfImages: [String] = ["arijit"]
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataIntoArrUser()
    }
    private func loadDataIntoArrUser(){
        collectionView.register(UINib(nibName: SuggetionForYouCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: SuggetionForYouCollectionViewCell.identifier)
        arrOfUsers = [UserInformation(name: "Arijit Singh", subName: "@arijitsingh")]
    }
}
// MARK: - CollectionView Methods
extension SuggestionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrOfUsers.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SuggetionForYouCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: SuggetionForYouCollectionViewCell.identifier, for: indexPath) as! SuggetionForYouCollectionViewCell
        
        cell.nameLabel.text = arrOfUsers[indexPath.row].name
        cell.subNameLabel.text = arrOfUsers[indexPath.row].subName
        cell.UserProfileImageView.image = UIImage(named: arrOfImages[indexPath.row])
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        return cell
    }
}
extension SuggestionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 220)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { return 10 }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { return 10 }
}
//MARK: - Structure
struct UserInformation{
    var name: String
    var subName: String
}
