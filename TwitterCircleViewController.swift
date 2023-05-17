//
//  TwitterCircleViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 15/05/23.
//

import UIKit

class TwitterCircleViewController: UIViewController {

    @IBOutlet weak var searchImageVIew: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var lineLabelTwo: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setSegments(index: 0)
    }
    
    private func setUp() {
        if self.revealViewController() != nil {
            backButton.addTarget(self.revealViewController(), action: #selector(self.revealViewController().revealToggle(_:)), for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        lineLabelTwo.layer.borderColor = UIColor.gray.cgColor
        lineLabelTwo.layer.borderWidth = 1
        searchTextField.layer.masksToBounds = true
        searchTextField.layer.cornerRadius = 10
    }
    private func setSegments(index: Int) {
        switch index {
        case 0:
            searchTextField.isHidden = true
            searchImageVIew.isHidden = true
        case 1:
            searchTextField.isHidden = false
            searchImageVIew.isHidden = false
        default:
            break
        }
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        setSegments(index: sender.selectedSegmentIndex)
    }
    
}
