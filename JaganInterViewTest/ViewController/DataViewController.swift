//
//  DataViewController.swift
//  JaganInterViewTest
//
//  Created by Ammulu on 20/01/18.
//  Copyright © 2018 JaganMohan. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var attributeLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var legsLbl: UILabel!
    var hero:HeroStats?

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = hero?.localized_name
        attributeLbl.text = hero?.primary_attr
        attackLbl.text = hero?.attack_type
        legsLbl.text = "\((hero?.legs)!)"
        let urlString = "https://api.opendota.com"+(hero?.img)!
        let url = URL(string: urlString)
        imageView.downloadedFrom(url: url!)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.contentMode = .scaleAspectFill
        
    }

}
