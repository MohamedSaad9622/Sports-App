//
//  NetworkManager.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import Foundation

class NetworkManager: APIService {
    // sports
    func fetch_sports(url: String, completion: @escaping (([Sport]?, Error?) -> Void)) {
        if let url = URL(string: url){
            let request = URLRequest(url: url)
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let task    = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(nil, error)
                }
                if let data = data {
                    // cast generic to specific type
                    if let decodedData: Sports = convertFromJson(data: data){
                        completion(decodedData.sports, nil)
                    }
                }
            }
            task.resume()
        }

    }
    
    // for leagues in sport
    func fetch_leagues(sport: String, completion: @escaping (([Country]?, Error?) -> Void)) {
        if let url = URL(string: Constants(sport: sport).sport_leagues_url ){
            let request = URLRequest(url: url)
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let task    = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(nil, error)
                }
                if let data = data {
                    
                    if let decodedData: Leagues = convertFromJson(data: data){
                        completion(decodedData.countries, nil)
                    }
                }
            }
            task.resume()
        }
    }
    
    
    // for events
    func fetch_events(leagueID:String, completion: @escaping (([Event]?,Error?) -> Void ) ) {
        if let url = URL(string: Constants(leagueID: leagueID).events_url){
            let request = URLRequest(url: url)
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let task    = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(nil, error)
                }
                if let data = data {
                    if let decodedData: Events = convertFromJson(data: data){
                        completion(decodedData.events, nil)
                    }
                }
            }
            task.resume()
        }
    }
    
    
    
}
