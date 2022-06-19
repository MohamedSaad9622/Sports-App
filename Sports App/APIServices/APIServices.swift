//
//  APIServices.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import Foundation

// protocol to match between networkManager and ModelController 
protocol APIService {
    func fetchDataFromApi(url:String, completion: @escaping (([Sport]?, Error?) -> Void))
}
