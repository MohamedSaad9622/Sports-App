//
//  Sports_presenter.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import Foundation

class Sports_presenter: ISportsPresenter {
    
    let sportsView : ISportsView
    
    init(sportsView : ISportsView) {
        self.sportsView = sportsView
    }
    
    func fetchSports(url: String) {
        let sportsModel : ISportsModel = Sports_ModelController(sportsPresenter: self)
        sportsModel.fetchDataFromAPI(url: url)
    }
    
    func onSuccess(sports: [Sport]) {
        sportsView.render_SportsView(sports: sports)
    }
    
    func onFailed(error: Error) {
        sportsView.postError(error: error)
    }
    
    
}
