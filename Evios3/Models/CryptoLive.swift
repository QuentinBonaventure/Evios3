//
//  CryptoLive.swift
//  Evios3
//
//  Created by Quentin Bona on 14/09/2022.
//

import Foundation

struct Datas: Codable{
    var data: [CryptoLive]
}

struct CryptoLive: Codable {
    let id: String
    let rank: String
    let name: String
    let value: String
    let evolution: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case rank
        case name
        case value = "priceUsd"
        case evolution = "changePercent24Hr"
    }
    
}
