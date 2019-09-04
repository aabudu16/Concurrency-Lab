//
//  CountryTableViewCell.swift
//  ConcurrencyLab
//
//  Created by Mr Wonderful on 9/3/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet var countryImage: UIImageView!
    @IBOutlet var CountryName: UILabel!
    @IBOutlet var capital: UILabel!
    @IBOutlet var population: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }


}
