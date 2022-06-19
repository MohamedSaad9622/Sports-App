//
//  League.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import Foundation

struct Leagues: Codable {
    // array of dictionary of type string : string?
    let countries: [Country]
}

struct Country: Codable {
    let strLeague:String
    let strBadge:String
    let strYoutube:String
}
