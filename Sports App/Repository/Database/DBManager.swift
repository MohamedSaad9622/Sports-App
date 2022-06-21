//
//  DBManager.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import Foundation
import CoreData



class DBManager {
    
    static let shared = DBManager()

    private init(){

    }

// MARK: -          Add League


    func addLeague(new_league: Country, appDelegate: AppDelegate, completion: @escaping ((Error?) -> Void)) {
        // check is favorites league or not first
        var foundedBefore: Bool = false
        getFavoriteLeagues_coreData(appDelegate: appDelegate) { Leagues, error in
            if let Leagues = Leagues {
                for league in Leagues {
                    if new_league.idLeague == league.idLeague{
                        foundedBefore = true
                        return
                    }
                }
            }
        }
        
        if foundedBefore == false {
            let managedContext = appDelegate.persistentContainer.viewContext
            if let entity = NSEntityDescription.entity(forEntityName: Constants.league_entityName, in: managedContext){
                let league = NSManagedObject(entity: entity, insertInto: managedContext)
                league.setValue(new_league.idLeague, forKey: dbKeys.id.rawValue)
                league.setValue(new_league.strLeague , forKey: dbKeys.leagueName.rawValue)
                league.setValue(new_league.strBadge, forKey: dbKeys.leagueImage.rawValue)
                league.setValue(new_league.strYoutube, forKey: dbKeys.leagueYoutube.rawValue)
                do {
                    try managedContext.save()
                    completion(nil)
                } catch let error as NSError {
                    completion(error)
                }
            }
        }
        
    }

//MARK: -   Fetch Leagues


    func getFavoriteLeagues_coreData(appDelegate:AppDelegate, completion: @escaping (([League]?,Error?) -> Void)) {

        let managedContext = appDelegate.persistentContainer.viewContext

        var leagues : [League] = []
        let request = NSFetchRequest<NSManagedObject>(entityName: "League")

        do {
           leagues = try managedContext.fetch(request) as! [League]
            completion(leagues, nil)
        } catch let error as NSError {
            completion(nil, error)
        }

    }
    
    
//MARK: -   Fetch League
    
    func getLeague(leagueId: String, appDelegate:AppDelegate) -> League {
        var league: [League] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSManagedObject>(entityName: "League")
        let predicate = NSPredicate(format: "idLeague == %@", leagueId)
        request.predicate = predicate
        do {
            league = try managedContext.fetch(request) as! [League]
        } catch let error as NSError {
            print("error in fetch movies")
            print(error.localizedDescription)
        }
        return league[0]
    }


//MARK: -    Delete League
    
    func deleteLeague(leagueId: String ,appDelegate:AppDelegate, completion: @escaping ((Error?) -> Void)) {
        let league = getLeague(leagueId: leagueId, appDelegate: appDelegate)
        let managedContext = appDelegate.persistentContainer.viewContext
        do {
            managedContext.delete(league)
            try managedContext.save()
            completion(nil)
        } catch let error as NSError {
            completion(error)
        }
    }



}
