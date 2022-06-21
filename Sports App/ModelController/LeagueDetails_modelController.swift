//
//  LeagueDetails_modelController.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import Foundation

class LeaguesDetails_modelController {
    let apiService : APIService = NetworkManager()
    var leagueDetailsPresenter_Api : ILeagueDetails_presenter_API?
    var leagueDetailsPresenter_coreData : ILeagueDetails_presenter_CoreData?
    
    init(leagueDetailsPresenter_Api : ILeagueDetails_presenter_API? = nil , leagueDetailsPresenter_coreData : ILeagueDetails_presenter_CoreData? = nil) {
        self.leagueDetailsPresenter_Api = leagueDetailsPresenter_Api
        self.leagueDetailsPresenter_coreData = leagueDetailsPresenter_coreData
    }
    
}



//MARK: - conform Api protocol


extension LeaguesDetails_modelController: ILeagueDetails_model_API{
    
    func fetchEventsFromAPI(leagueID: String) {
        
        apiService.fetch_events(leagueID: leagueID) { events, error in
            if let events = events {
                print("&&&&&&&&&&&&&&&&&& fetchEventsFromAPI done")
                self.leagueDetailsPresenter_Api?.onSuccess_Api(events: events)
            }
            if let error = error {
                print("&&&&&&&&&&&&&&&&&& fetchEventsFromAPI error")
                self.leagueDetailsPresenter_Api?.onFailed_Api(error: error)
            }
            if error == nil && events == nil {
                print("&&&&&&&&&&&&&&&&&& fetchEventsFromAPI nilllllllllllllllllllllllllllllllllllllll")
            }
        }
    }
    
    func fetchTeamsFromAPI(leagueName: String) {

        apiService.fetch_Teams(leagueName: leagueName) { teams, error in
            if let teams = teams {
                self.leagueDetailsPresenter_Api?.onSuccess_TeamsApi(teams: teams)
            }
            if let error = error {
                self.leagueDetailsPresenter_Api?.onFailed_TeamsApi(error: error)
            }
        }
    }
}



//MARK: - conform CoreData protocol

extension LeaguesDetails_modelController: ILeagueDetails_model_CoreData{
    
    func addToFavorites_inCoreData(league: Country, appDelegate: AppDelegate) {
        DBManager.shared.addLeague(new_league: league, appDelegate: appDelegate) { error in
            if let error = error {
                self.leagueDetailsPresenter_coreData?.onFailed_CoreData(error: error)
                return
            }else{
                self.leagueDetailsPresenter_coreData!.onSuccess_CoreData()
            }
        }
    }

    func removeFromFavorites_fromCoreData(leagueId: String, appDelegate: AppDelegate) {
        DBManager.shared.deleteLeague(leagueId: leagueId, appDelegate: appDelegate) { error in
            if let error = error {
                self.leagueDetailsPresenter_coreData?.onFailed_CoreData(error: error)
                return
            }
            else{
                self.leagueDetailsPresenter_coreData!.onSuccess_CoreData()
            }
        }
    }

}
