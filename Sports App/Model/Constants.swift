//
//  Constants.swift
//  Sports App
//
//  Created by MAC on 18/06/2022.
//

import Foundation

struct Constants {
    
    
//MARK: - storyboards
    static let second_storyBoard_name           = "Leagues"
    static let LeagueDetails_storyBoard_name     = "LeagueDetails"
    
//MARK: -  viewController id
    
    static let leagues_ViewController_ID         = "leaguesViewController"
    static let leagueDetail_ViewController_ID     = "LeagueDetails_ViewController"
    
//MARK: -  collection cells identifier
    
    static let sports_collectionCell_identifier        = "sports_cell"
    static let sports__nib_name                      = "CollectionViewCell"
    
    static let upcomingEvent_collectionView_identifier  =  "upcoming_cell"
    static let upcomingEvent_nib_name                 =  "UpcomingEvent_CollectionViewCell"
    
    static let latestResults_collectionView_identifier  =  "LatestResults_cell"
    static let latestResults_nib_name                 =  "LatestResults_CollectionViewCell"
    
    static let teams_collectionView_identifier         =  "teams_cell"
    static let teams_nib_name                        =  "Teams_CollectionViewCell"
    
//MARK: -   TableView cells identifier
    
    static let leagues_tableViewCell_identifier  = "leagues_cell"
    static let leagues_nib_name                = "leaguesTableViewCell"
    
//MARK: -   Url
    static let sports_url_string               = "https://www.thesportsdb.com/api/v1/json/2/all_sports.php"
    
    // for search for leagues in sport
    // to force set sport before use sport_leagues_url make it object member
    var  sport:String
    var sport_leagues_url : String{
        return "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=\(sport)"
    }
    
    
    
}
