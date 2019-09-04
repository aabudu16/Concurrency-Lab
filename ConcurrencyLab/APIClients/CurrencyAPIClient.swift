//
//  CurrencyAPIClient.swift
//  ConcurrencyLab
//
//  Created by Mr Wonderful on 9/3/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit


struct CurrencyAPIClient{
    static let shared = CurrencyAPIClient()
    let currencyURL = "http://data.fixer.io/api/latest?access_key=a17aef5ece92cf36d9c5963f7f4babf1&format=1"
    
    func fetchData(complition: @escaping (Result<Rates,ErrorHandler>)->()){
        
        guard let url = URL(string: currencyURL) else { complition(.failure(.canNotConvertURL))
            return}
        
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            if let _ = err {
                complition(.failure(.noDataAvailable))
                return}
            
            guard let retrievedData = data else {complition(.failure(.cantProcessData))
                return}
            
            do{
                let responseData = try JSONDecoder().decode(CurrencyRate.self, from: retrievedData)
                complition(.success(responseData.rates))
            }catch {
                complition(.failure(.noDataAvailable))
            }
            
            }.resume()
    }
}
