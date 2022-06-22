//
//  FavoritesViewController.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import UIKit


class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoriteLeagues_tableView: UITableView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var favoriteLeagues : [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoriteLeagues_tableView.register(UINib(nibName: Constants.leagues_nib_name, bundle: nil), forCellReuseIdentifier: Constants.leagues_tableViewCell_identifier)

        favoriteLeagues_tableView.delegate = self
        favoriteLeagues_tableView.dataSource = self
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let favoritesPresenter : IFavorites_presenter = Favorites_presenter(favoritesView: self)
        favoritesPresenter.fetchFavoritesLeague(appDelegate: appDelegate)
    }
    

}

//MARK: -  CoreData Protocols

extension FavoritesViewController: IFavorites_View{
    
    func render_upcomingView(leagues: [Country]) {
        favoriteLeagues = leagues
        DispatchQueue.main.async {
            self.favoriteLeagues_tableView.reloadData()
        }
    }
    
    func postError_upcomingView(error: Error) {
        addAlert(title: "Alert!", message: "\(error.localizedDescription)", ActionTitle: "Cancel", viewController: self)
    }
    
    
}



//MARK: -                                   TableView


extension FavoritesViewController: UITableViewDelegate{

}

extension FavoritesViewController: UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return favoriteLeagues.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = favoriteLeagues_tableView.dequeueReusableCell(withIdentifier: Constants.leagues_tableViewCell_identifier, for: indexPath) as? leaguesTableViewCell else { return UITableViewCell() }
        cell.setCell(league: favoriteLeagues[indexPath.section])
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if !Connectivity.isConnectedToInternet() {
            addAlert(title: "Alert!", message: "There is no internet connection", ActionTitle: "Cancel", viewController: self)
            return
        }
        
        let storyboard = UIStoryboard(name: Constants.LeagueDetails_storyBoard_name, bundle: nil)
        let leagueDetails_vc = storyboard.instantiateViewController(withIdentifier: Constants.leagueDetail_ViewController_ID) as! LeagueDetails_ViewController
        leagueDetails_vc.league = favoriteLeagues[indexPath.section]
        leagueDetails_vc.previousViewController = Constants.favoritesViewController
        leagueDetails_vc.modalPresentationStyle = .fullScreen
        self.present(leagueDetails_vc, animated: true, completion: nil)
        
    }


}
