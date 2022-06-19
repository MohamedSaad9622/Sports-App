//
//  SportsVC_Protocols.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import Foundation

protocol ISportsView {
    func render_SportsView(sports:[Sport])
    func postError(error:Error)
}

protocol ISportsPresenter {
    func fetchSports(url:String)
    func onSuccess(sports:[Sport])
    func onFailed(error:Error)
}

protocol ISportsModel {
    func fetchDataFromAPI(url:String)
}
