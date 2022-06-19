//
//  Sport.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

struct Sports: Codable {
    let sports: [Sport]
}

// MARK: - Sport

struct Sport: Codable {
    let idSport, strSport: String
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}

