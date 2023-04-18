//
//  ChooseCategoryViewController.swift
//  Twitter
//
//  Created by R83 on 18/02/23.
//

import UIKit

class ChooseCategoryViewController: UIViewController {
    
//MARK: - OUTLET AND VARIABLES
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    var arrOfCategorys: [String] = ["Entertainment","Music","Sports","Fashion & beauty","Food","Gaming","Technology","Business & finance",
                                    "Art & culture","Travel","Outdoors","Fitness","Careers","Family & relationships","Animation & comics",
                                    "Science"]
    var numberOfItemInRow: Int = 2
    var interItemSpac: CGFloat = 10
    var selectedIndex: [Int] = [-1]
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 15
        ragisterNib()
    }
//MARK: - FUNCTION
    func ragisterNib(){
        collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
//MARK: - BUTTON ACTION
    @IBAction func nextButtonAction(_ sender: UIButton) {
        let languageViewController = storyboard?.instantiateViewController(withIdentifier: "LanguageViewController") as! LanguageViewController
        navigationController?.pushViewController(languageViewController, animated: true)
    }
}
//MARK: - COLLECTIONVIEW METHODS
extension ChooseCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrOfCategorys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        let category = arrOfCategorys[indexPath.row]
        cell.nameLabel.text = category
        cell.layer.masksToBounds = true
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        if selectedIndex.contains(indexPath.item){
            cell.backView.backgroundColor = UIColor.systemBlue
            cell.nameLabel.textColor = .white
            cell.layer.borderColor = UIColor.clear.cgColor
        }else{
            cell.backView.backgroundColor = UIColor.white
            cell.nameLabel.textColor = .black
            cell.layer.borderColor = UIColor.black.cgColor
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedIndex.contains(indexPath.item){
            let index = selectedIndex.firstIndex(of: indexPath.item)
        }
        else{
            selectedIndex.append(indexPath.item)
        }
        collectionView.reloadData()
    }
}
extension ChooseCategoryViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = CGFloat(numberOfItemInRow+1)*interItemSpac
        let avilableWidth = collectionView.frame.width - spacing
        let cellWidth = avilableWidth / CGFloat(numberOfItemInRow)
        return CGSize(width: cellWidth, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { return 8 }
}
