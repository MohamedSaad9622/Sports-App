//
//  LeagueDetailsVC_protocol.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import Foundation


//MARK: - Events and Teams protocols

protocol ILeagueDetails_view_API {
    func render_upcomingView(events:[Event])
    func postError_upcomingView(error:Error)
    
    func render_TeamsView(teams:[Team])
    func postError_TeamsView(error:Error)
}

protocol ILeagueDetails_presenter_API {

    func fetchEvents(leagueID:String)
    func onSuccess_Api(events: [Event])
    func onFailed_Api(error:Error)
    
    func fetchTeams(leagueName: String)
    func onSuccess_TeamsApi(teams:[Team])
    func onFailed_TeamsApi(error:Error)
}

protocol ILeagueDetails_model_API{
    func fetchEventsFromAPI(leagueID:String)
    
    func fetchTeamsFromAPI(leagueName: String)
}




//MARK: - CoreData protocols


protocol ILeagueDetails_view_CoreData {
    func savedIn_CoreData()
    func saveFailed_CoreData(error:Error)
}

protocol ILeagueDetails_presenter_CoreData {
    func addToFavorites(league:Country, appDelegate:AppDelegate)
    func removeFromFavorites(leagueId:String, appDelegate:AppDelegate)
    func onSuccess_CoreData()
    func onFailed_CoreData(error:Error)
}

protocol ILeagueDetails_model_CoreData{
    func addToFavorites_inCoreData(league:Country, appDelegate:AppDelegate)
    func removeFromFavorites_fromCoreData(leagueId:String, appDelegate:AppDelegate)
}
