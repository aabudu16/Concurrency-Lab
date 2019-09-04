//
//  DetailedViewController.swift
//  ConcurrencyLab
//
//  Created by Mr Wonderful on 9/3/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    @IBOutlet var imageDVC: UIImageView!
    @IBOutlet var countryName: UILabel!
    @IBOutlet var capitalDVC: UILabel!
    @IBOutlet var populationDVC: UILabel!
    var detailedCountryVC:Countries!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDetailedVC()
    }
    

    func setupDetailedVC(){
        countryName.text = detailedCountryVC.name
        capitalDVC.text = "Capital: \(detailedCountryVC.capital)"
        populationDVC.text = "Population: \(detailedCountryVC.population)"
    }

}
