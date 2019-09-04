//
//  ViewController.swift
//  ConcurrencyLab
//
//  Created by Mr Wonderful on 9/3/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {
    
    var country = [Countries](){
        didSet{
            DispatchQueue.main.async {
                self.countryTableView.reloadData()
            }
        }
    }
    var currency = [Rates](){
        didSet{
            DispatchQueue.main.async {
                self.countryTableView.reloadData()
            }
        }
    }
    @IBOutlet var countryTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchCountryData()
    }
    
    var countrySearchString:String? = nil {
        didSet {
            self.countryTableView.reloadData()
        }
    }
    
    var countrySearchResult:[Countries]{
        get {
            guard let searchString = countrySearchString else{
                return country
            }
            guard searchString != "" else {
                return country
            }
            return
        country.filter({$0.name.lowercased().replacingOccurrences(of: " ", with: "").contains(searchString.lowercased().replacingOccurrences(of: " ", with: ""))})
        }
    }
    func setupTableView(){
        countryTableView.delegate = self
        countryTableView.dataSource = self
        searchBar.delegate = self
        
    }
    func fetchCountryData(){
        CountryAPIClient.shared.fetchData { (result) in
            
            switch result{
            case .failure(let countryError):
                print("cant get data \(countryError)")
            case .success(let country):
                self.country = country
            }
        }
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
}

extension CountryViewController: UITableViewDelegate{}
extension CountryViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countrySearchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell") as? CountryTableViewCell else  {return UITableViewCell()}
        let info = countrySearchResult[indexPath.row]
        
        
        cell.CountryName.text = info.name
        cell.capital.text = "Capital: \(info.capital)"
        cell.population.text = "Population: \(info.population)"
        
        if let imageURL = URL(string: info.flag){
            DispatchQueue.global().async{
                let data = try? Data(contentsOf: imageURL)
                if let imageData = data{
                    let image = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        cell.countryImage.image = image
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedCountryVC = storyboard?.instantiateViewController(withIdentifier: "CountryDVC") as! DetailedViewController
        
        let info = country[indexPath.row]
        
        detailedCountryVC.detailedCountryVC = info
        
        self.navigationController?.pushViewController(detailedCountryVC, animated: true)
    }
}

extension CountryViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        countrySearchString = searchBar.text
    }
}
