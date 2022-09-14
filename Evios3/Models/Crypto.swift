//
//  Crypto.swift
//  Evios3
//
//  Created by Quentin Bona on 14/09/2022.
//

import Foundation

struct Coins: Codable{
    var coins: [Crypto]
}

struct Crypto: Codable{
    var name: String
    var icon: String?
    
}


