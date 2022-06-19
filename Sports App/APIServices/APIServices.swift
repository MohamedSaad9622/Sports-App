//
//  APIServices.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import Foundation

// protocol to match between networkManager and ModelController 
protocol APIService {
    func fetchDataFromApi_sports(url:String, completion: @escaping (([Sport]?, Error?) -> Void))
    func fetchDataFromApi_leagues(sport:String, completion: @escaping (([Country]?, Error?) -> Void))
}
