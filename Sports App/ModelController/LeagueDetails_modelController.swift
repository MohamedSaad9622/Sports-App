//
//  LeagueDetails_modelController.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import Foundation

class LeaguesDetails_modelController: ILeagueDetails_model {
    
    var leagueDetails_presenter : ILeagueDetails_presenter
    
    init(leagueDetails_presenter : ILeagueDetails_presenter) {
        self.leagueDetails_presenter = leagueDetails_presenter
    }
    
    func fetchEventsFromAPI(leagueID: String) {
        let apiService : APIService = NetworkManager()
        apiService.fetch_events(leagueID: leagueID) { events, error in
            if let events = events {
                self.leagueDetails_presenter.onSuccess(events: events)
            }
            if let error = error {
                self.leagueDetails_presenter.onFailed(error: error)
            }
        }
    }
    
}
