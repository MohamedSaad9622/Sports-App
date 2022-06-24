//
//  Teams.swift
//  Sports App
//
//  Created by MAC on 21/06/2022.
//

import Foundation

struct Teams: Codable {
    let teams: [Team]
}

struct Team: Codable {
    let idTeam: String
    let strTeam: String
    let strTeamBadge: String
    let intFormedYear: String
    let strSport: String
    let strLeague: String
    let strDescriptionEN: String
    let strWebsite: String
    let strYoutube: String
    let strFacebook: String
    let strTwitter: String
    let strInstagram: String
    let strStadiumThumb: String?
    let strTeamJersey:String?

}
