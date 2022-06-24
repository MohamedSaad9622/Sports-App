//
//  Event.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import Foundation



struct Events: Codable {
    let events: [Event]
}



struct Event: Codable {
    let idEvent: String
    let strEvent: String
    let dateEvent: String
    let strTime: String
    let strHomeTeam: String
    let strAwayTeam: String
    let intHomeScore: String
    let intAwayScore: String
    let strThumb: String

}
