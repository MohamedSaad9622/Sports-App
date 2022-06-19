//
//  LeaguesVC_protocols.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import Foundation

protocol ILeaguesView {
    func render_leaguesView(leagues: [Country])
    func postError(error:Error)
}

protocol ILeaguesPresenter {
    func fetchLeagues(sport:String)
    func onSuccess(leagues: [Country])
    func onFailed(error:Error)
}

protocol ILeaguesModel {
    func fetchLeaguesFromAPI(sport:String)
}
