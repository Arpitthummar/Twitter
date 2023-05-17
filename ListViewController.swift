//
//  ListViewController.swift
//  Twitter
//
//  Created by Arpit Thummar on 10/05/23.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var lineLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    private func setUp() {
        if self.revealViewController() != nil {
            backButton.addTarget(self.revealViewController(), action: #selector(self.revealViewController().revealToggle(_:)), for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        lineLabel.layer.borderColor = UIColor.gray.cgColor
        lineLabel.layer.borderWidth = 1
    }
}
