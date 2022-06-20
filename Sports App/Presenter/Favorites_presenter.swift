//
//  Favorites_presenter.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import Foundation

class Favorites_presenter: IFavorites_presenter {
    
    var favoritesView: IFavorites_View
    
    init(favoritesView: IFavorites_View) {
        self.favoritesView = favoritesView
    }
    func fetchFavoritesLeague(appDelegate: AppDelegate) {
        let favoritesModel : IFavorites_model = Favorites_modelController(favoritesPresenter: self)
        favoritesModel.fetchFavoritesLeague(appDelegate: appDelegate)
    }
    
    func onSuccess(leagues: [League]) {
        // to convert from League "coreData entity row" to Country "api model"
        var convertedLeague_toCountry : [Country] = []
        var id:String = ""
        var name: String = ""
        var image: String = ""
        var youtube_link: String = ""
        
        for league in leagues {
            if let idLeague = league.idLeague{ id = idLeague}
            if let strLeague = league.strLeague{ name = strLeague }
            if let strBadge = league.strBadge { image = strBadge }
            if let strYoutube = league.strYoutube { youtube_link = strYoutube}
            convertedLeague_toCountry.append(Country(idLeague: id, strLeague: name, strBadge: image, strYoutube: youtube_link))
        }
        self.favoritesView.render_upcomingView(leagues: convertedLeague_toCountry)
    }
    
    func onFailed(error: Error) {
        self.favoritesView.postError_upcomingView(error: error)
    }

}
