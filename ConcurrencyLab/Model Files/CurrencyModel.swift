//
//  CurrencyModel.swift
//  ConcurrencyLab
//
//  Created by Mr Wonderful on 9/3/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

struct CurrencyRate:Codable{
    let rates:Rates
}

struct Rates:Codable{
    let USD:Double
    let TZS:Double
    let AED:Double
    let GBP:Double
    let MXN:Double
}
