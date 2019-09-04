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
    @IBOutlet var countryCurrency: UILabel!
    @IBOutlet var dollarValue: UILabel!
    
    var detailedCountryVC:Countries!
    
    var currency = [Rates](){
        didSet{
            DispatchQueue.main.async {
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCurrancyData()
        setupDetailedVC()
    }
    
    
    func setupDetailedVC(){
        countryName.text = detailedCountryVC.name
        capitalDVC.text = "Capital: \(detailedCountryVC.capital)"
        populationDVC.text = "Population: \(detailedCountryVC.population)"
        countryCurrency.text = detailedCountryVC.currencies[0].code
    }
    
    func fetchCurrancyData(){
        CurrencyAPIClient.shared.fetchData { (result) in
            switch result{
            case .failure(let currancyError):
                print("Cant recieve data \(currancyError)")
            case .success(let currency):
                self.currency = currency
            }
        }
    }
    
    func correctCurrencyRateInUSD(){
        
//        for rate in currency{
//            switch rate{
//            case "USD":
//                rate.USD
//            }
//        }
//    }
    
}
}
