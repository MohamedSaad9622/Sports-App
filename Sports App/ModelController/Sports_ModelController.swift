//
//  Sports_ModelController.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import Foundation

class Sports_ModelController: ISportsModel {
    let apiService : APIService = NetworkManager()
    let sportsPresenter : Sports_presenter
    
    init(sportsPresenter:Sports_presenter) {
        self.sportsPresenter = sportsPresenter
    }
    
    func fetchDataFromAPI(url: String) {
        
        apiService.fetchDataFromApi(url: url) { sports, error in
            if let error = error {
                self.sportsPresenter.onFailed(error: error)
            }
            if let sports = sports {
                
                self.sportsPresenter.onSuccess(sports: sports)
            }
        }
    }
    
    
}
