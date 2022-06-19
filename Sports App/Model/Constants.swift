//
//  Constants.swift
//  Sports App
//
//  Created by MAC on 18/06/2022.
//

import Foundation

struct Constants {
    
    static let sports_collectionCell_identifier   = "sports_cell"
    static let sports_collectionView_Cell        = "CollectionViewCell"
    
    static let second_storyBoard_name           = "Leagues"
    static let leagues_ViewController_ID         = "leaguesViewController"
    static let leagues_tableViewCell_identifier   = "leagues_cell"
    static let leagues_nib_name                 = "leaguesTableViewCell"
    
    static let sports_url_string                = "https://www.thesportsdb.com/api/v1/json/2/all_sports.php"
    
    // for search for leagues in sport
    // to force set sport before use sport_leagues_url make it object member
    var  sport:String
    var sport_leagues_url : String{
        return "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=\(sport)"
    }
}
