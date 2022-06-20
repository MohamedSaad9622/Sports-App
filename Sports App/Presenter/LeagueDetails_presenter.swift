//
//  LeagueDetails_presenter.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import Foundation

class LeagueDetails_presenter: ILeagueDetails_presenter {
    
    var leagueDetails_view: ILeagueDetails_view
    
    init(leagueDetails_view: ILeagueDetails_view) {
        self.leagueDetails_view = leagueDetails_view
    }
    
    func fetchEvents(leagueID: String) {
        let leagueDetails_model : ILeagueDetails_model = LeaguesDetails_modelController(leagueDetails_presenter: self)
        leagueDetails_model.fetchEventsFromAPI(leagueID: leagueID)
    }
    
    func onSuccess(events: [Event]) {
        self.leagueDetails_view.render_upcomingView(events: events)
    }
    
    func onFailed(error: Error) {
        self.leagueDetails_view.postError_upcomingView(error: error)
    }
    
    
}
