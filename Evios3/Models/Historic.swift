//
//  Historic.swift
//  Evios3
//
//  Created by Quentin Bona on 14/09/2022.
//

import Foundation

struct DatasDetails: Codable {
    var data : [Historic]
   
}

struct Historic: Codable{
    var priceUsd : String
    var date : String
}

