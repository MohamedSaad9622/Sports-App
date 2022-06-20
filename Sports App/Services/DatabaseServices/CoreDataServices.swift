//
//  CoreDataService.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import Foundation

protocol CoreDataServices{
    func addLeague(new_league : Country, appDelegate:AppDelegate , completion: @escaping ((Error?) -> Void))
    func removeMovie(new_league : Country, appDelegate:AppDelegate , completion: @escaping ((Error?) -> Void))
}
