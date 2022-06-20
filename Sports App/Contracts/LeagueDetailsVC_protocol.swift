//
//  LeagueDetailsVC_protocol.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import Foundation

protocol ILeagueDetails_view {
    func render_upcomingView(events:[Event])
    func postError_upcomingView(error:Error)
}

protocol ILeagueDetails_presenter {
    func fetchEvents(leagueID:String)
    func onSuccess(events:[Event])
    func onFailed(error:Error)
}

protocol ILeagueDetails_model {
    func fetchEventsFromAPI(leagueID:String)
}
