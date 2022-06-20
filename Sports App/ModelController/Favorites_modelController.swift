//
//  Favorites_modelController.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import Foundation

class Favorites_modelController: IFavorites_model {
    
    var favoritesPresenter : IFavorites_presenter
    
    init(favoritesPresenter : IFavorites_presenter) {
        self.favoritesPresenter = favoritesPresenter
    }
    
    func fetchFavoritesLeague(appDelegate: AppDelegate) {
        DBManager.shared.getFavoritesLeague_coreData(appDelegate: appDelegate) { leagues, error in
            if let error = error {
                self.favoritesPresenter.onFailed(error: error)
            }
            if let leagues = leagues {
                self.favoritesPresenter.onSuccess(leagues: leagues)
            }
        }
    }
    
}
