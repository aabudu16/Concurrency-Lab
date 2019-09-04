//
//  CountryAPIClient.swift
//  ConcurrencyLab
//
//  Created by Mr Wonderful on 9/3/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit


struct CountryAPIClient{
    static let shared = CountryAPIClient()
    
    let countryURL = "https://restcountries.eu/rest/v2/name/united"
    
    func fetchData(complition: @escaping (Result<[Countries],ErrorHandler>) -> ()){
        
        guard let url = URL(string: countryURL) else { complition(.failure(.canNotConvertURL))
            return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
           if let _ = error {
                complition(.failure(.noDataAvailable))
                return}
            
            guard let retrievedData = data else {complition(.failure(.cantProcessData))
                return}
            
                do{
                    let responseData = try JSONDecoder().decode([Countries].self, from: retrievedData)
                    complition(.success(responseData))
                }catch{
                    complition(.failure(.cantProcessData))
                }
                
            }.resume()
        }
    }

