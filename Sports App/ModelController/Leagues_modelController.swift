//
//  Leagues_modelController.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import Foundation

class Leagues_modelController: ILeaguesModel {
    
    let leaguesPresenter : ILeaguesPresenter
    
    init(leaguesPresenter : ILeaguesPresenter) {
        self.leaguesPresenter = leaguesPresenter
    }
    
    func fetchLeaguesFromAPI(sport: String) {
        let apiService : APIService = NetworkManager()
        
        apiService.fetch_leagues(sport: sport) { Leagues, error in
            if let error = error {
                self.leaguesPresenter.onFailed(error: error)
            }
            if let Leagues = Leagues {
                self.leaguesPresenter.onSuccess(leagues: Leagues)
            }
        }
    }
}
