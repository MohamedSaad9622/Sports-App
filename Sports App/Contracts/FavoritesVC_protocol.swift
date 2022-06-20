//
//  FavoritesVC_protocol.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import Foundation


protocol IFavorites_View {
    func render_upcomingView(leagues: [Country])
    func postError_upcomingView(error:Error)
}


protocol IFavorites_presenter {
    func fetchFavoritesLeague(appDelegate:AppDelegate)
    func onSuccess(leagues: [League])
    func onFailed(error:Error)
}


protocol IFavorites_model {
    func fetchFavoritesLeague(appDelegate:AppDelegate)
}
