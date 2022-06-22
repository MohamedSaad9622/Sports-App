//
//  League.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import Foundation

struct Leagues: Codable {
    let countries: [Country]
}

struct Country: Codable {
    let idLeague:String
    let strLeague:String
    let strBadge:String
    let strYoutube:String
}
