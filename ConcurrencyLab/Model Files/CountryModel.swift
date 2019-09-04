//
//  CountryModel.swift
//  ConcurrencyLab
//
//  Created by Mr Wonderful on 9/3/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

struct Countries:Codable{
    let name:String
    let capital:String
    let population:Int
    let currencies:[Currency]
    let flag:String
}

struct Currency:Codable{
    let code:String
    let name:String
    let symbol:String
}
