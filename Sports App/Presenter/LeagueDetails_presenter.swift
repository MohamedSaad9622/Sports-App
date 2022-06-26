//
//  LeagueDetails_presenter.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import Foundation

class LeagueDetails_presenter {
    
    var leagueDetails_model : ILeagueDetails_model_API?
    var leagueDetailsView_Api: ILeagueDetails_view_API?
    var leagueDetailsView_coreData: ILeagueDetails_view_CoreData?
    
    private let currentYear = Calendar.current.component(.year, from: Date())
    
    init(leagueDetailsView_Api: ILeagueDetails_view_API? = nil, leagueDetailsView_coreData: ILeagueDetails_view_CoreData? = nil) {
        self.leagueDetailsView_Api = leagueDetailsView_Api
        self.leagueDetailsView_coreData = leagueDetailsView_coreData
    }
    
}


//MARK: -                           conform Api protocol


extension LeagueDetails_presenter: ILeagueDetails_presenter_API{

    // upcomming Events
    
    // premier league id = "4328"    ,     "English%20Premier%20League"
    
    func fetchUpCommingEvents(leagueID: String) {
        self.leagueDetails_model = LeaguesDetails_modelController(leagueDetailsPresenter_Api: self)
        leagueDetails_model?.fetchEventsFromAPI(leagueID: leagueID, leagueSeason: "\(currentYear - 1)-\(currentYear)")
    }
    
    func onSuccess_UpCommingEvents(events: [Event]) {
        leagueDetailsView_Api?.render_upcomingView(events: events)
    }
    
    func onFailed_UpCommingEvents(error: Error) {
        leagueDetailsView_Api?.postError_upcomingView(error: error)
    }
    
    // latest Events
    func fetchLatestResultsEvents(leagueID: String) {
        self.leagueDetails_model = LeaguesDetails_modelController(leagueDetailsPresenter_Api: self)
        leagueDetails_model?.fetchLatestResultsFromAPI(leagueID: leagueID, leagueSeason: "\(currentYear - 1)-\(currentYear)")
    }
    
    func onSuccess_LatestResultsEvents(events: [Event]) {
        leagueDetailsView_Api?.render_LatestResultView(events: events)
    }
    
    func onFailed_LatestResultsEvents(error: Error) {
        leagueDetailsView_Api?.postError_LatestResultView(error: error)
    }
    
    // teams
    func fetchTeams(leagueName: String) {
        self.leagueDetails_model  = LeaguesDetails_modelController(leagueDetailsPresenter_Api:self)
        let leagueName_arr = leagueName.components(separatedBy: " ")
        var leagueName_final = leagueName_arr[0]
        for index in 1..<leagueName_arr.count {
            leagueName_final += "%20\(leagueName_arr[index])"
        }
        leagueDetails_model?.fetchTeamsFromAPI(leagueName: leagueName_final)
    }
    
    func onSuccess_TeamsApi(teams: [Team]) {
        leagueDetailsView_Api?.render_TeamsView(teams: teams)
    }
    
    func onFailed_TeamsApi(error: Error) {
        leagueDetailsView_Api?.postError_TeamsView(error: error)
    }
}



//MARK: -                               conform coreData protocol


extension LeagueDetails_presenter: ILeagueDetails_presenter_CoreData{
    
    func addToFavorites(league: Country, appDelegate: AppDelegate) {
        let leagueDetailsModel : ILeagueDetails_model_CoreData = LeaguesDetails_modelController(leagueDetailsPresenter_coreData: self)
        leagueDetailsModel.addToFavorites_inCoreData(league: league, appDelegate: appDelegate)
    }
    
    func removeFromFavorites(leagueId: String, appDelegate: AppDelegate) {
        let leagueDetailsModel : ILeagueDetails_model_CoreData = LeaguesDetails_modelController(leagueDetailsPresenter_coreData: self)
        leagueDetailsModel.removeFromFavorites_fromCoreData(leagueId: leagueId, appDelegate: appDelegate)
    }
    
    func onSuccess_CoreData() {
        self.leagueDetailsView_coreData?.savedIn_CoreData()
    }
    
    func onFailed_CoreData(error: Error) {
        self.leagueDetailsView_coreData?.saveFailed_CoreData(error: error)
    }
    
    
    
    
    

    
    
}
