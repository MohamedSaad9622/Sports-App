//
//  LeaguesViewController.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import UIKit

class LeaguesViewController: UIViewController {

    @IBOutlet weak var leagues_tableView: UITableView!
    
    var leagues : [Country] = []
    var sport: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leagues_tableView.register(UINib(nibName: Constants.leagues_nib_name, bundle: nil), forCellReuseIdentifier: Constants.leagues_tableViewCell_identifier)
        
        leagues_tableView.delegate = self
        leagues_tableView.dataSource = self
        
        self.title = "Leagues"
        
        let leaguesPresenter: ILeaguesPresenter = Leagues_presenter(leaguesView: self)
        leaguesPresenter.fetchLeagues(sport: sport)
        
        
    }


}

//MARK: -  ILeaguesView Protocol

extension LeaguesViewController: ILeaguesView{

    func render_leaguesView(leagues: [Country]) {
        self.leagues = leagues
        DispatchQueue.main.async {
            self.leagues_tableView.reloadData()
        }
    }
    
    func postError(error: Error) {
        let alert = UIAlertController(title: "Alert!", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}


//MARK: - TableView

extension LeaguesViewController: UITableViewDelegate{
    
}

extension LeaguesViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = leagues_tableView.dequeueReusableCell(withIdentifier: Constants.leagues_tableViewCell_identifier, for: indexPath) as? leaguesTableViewCell else { return UITableViewCell() }
        
        cell.setCell(league: leagues[indexPath.section])
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: Constants.LeagueDetails_storyBoard_name, bundle: nil)
        let leagueDetails_vc = storyboard.instantiateViewController(withIdentifier: Constants.leagueDetail_ViewController_ID) as! LeagueDetails_ViewController
        leagueDetails_vc.modalPresentationStyle = .fullScreen
        self.present(leagueDetails_vc, animated: true, completion: nil)
        
    }
    
    
}
