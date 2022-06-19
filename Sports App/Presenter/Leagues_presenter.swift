//
//  Leagues_presenter.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import Foundation

class Leagues_presenter: ILeaguesPresenter {
    
    let leaguesView: ILeaguesView
    
    init(leaguesView: ILeaguesView) {
        self.leaguesView = leaguesView
    }
    
    func fetchLeagues(sport: String) {
        let leaguesModel: ILeaguesModel = Leagues_modelController(leaguesPresenter: self)
        leaguesModel.fetchLeaguesFromAPI(sport: sport)
    }
    
    func onSuccess(leagues: [Country]) {
        leaguesView.render_leaguesView(leagues: leagues)
    }
    
    func onFailed(error: Error) {
        leaguesView.postError(error: error)
    }
    
    
    
}
