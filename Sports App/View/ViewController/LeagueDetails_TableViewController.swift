//
//  LeagueDetails_TableViewController.swift
//  Sports App
//
//  Created by MAC on 24/06/2022.
//

import UIKit

class LeagueDetails_TableViewController: UITableViewController {

    @IBOutlet weak var upcomingEvents_collectionView: UICollectionView!
    @IBOutlet weak var latestResults_collectionView: UICollectionView!
    @IBOutlet weak var teams_collectionView: UICollectionView!
    
    @IBOutlet weak var addToFavorite_button: UIBarButtonItem!
    var league: Country?
    var previousViewController : String?
    
    var upcomingEvents:[Event] = []
    var latestResult: [Event] = []
    var teams: [Team] = []
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()

        
        
        let leagueDetails_presenter : ILeagueDetails_presenter_API = LeagueDetails_presenter(leagueDetailsView_Api: self)
       
        if let league = league {
            
            leagueDetails_presenter.fetchUpCommingEvents(leagueID: league.idLeague)
            leagueDetails_presenter.fetchLatestResultsEvents(leagueID: league.idLeague)
            leagueDetails_presenter.fetchTeams(leagueName: league.strLeague)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if previousViewController == Constants.favoritesViewController {
            addToFavorite_button.image = UIImage(systemName: "heart.fill")
        }
    }
    
    
// MARK: -                               BUTTONS ACTION
    
    
    
    @IBAction func goBack_button(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToFavorites_button(_ sender: UIBarButtonItem) {
        
        let leagueDetails_presenter : ILeagueDetails_presenter_CoreData = LeagueDetails_presenter(leagueDetailsView_coreData: self)
        if self.addToFavorite_button.image == UIImage(systemName: "heart.fill") {
            
            if let league = league {
                leagueDetails_presenter.removeFromFavorites(leagueId: league.idLeague , appDelegate: appDelegate)
            }
            self.addToFavorite_button.image = UIImage(systemName: "heart")
        }
        else{
            if let league = league {
                leagueDetails_presenter.addToFavorites(league: league, appDelegate: appDelegate)
            }
            self.addToFavorite_button.image = UIImage(systemName: "heart.fill")
        }
    }
    

}





//MARK: -                                   Api Protocol




extension LeagueDetails_TableViewController: ILeagueDetails_view_API{
    
    func render_upcomingView(events: [Event]) {
        self.upcomingEvents = events
        DispatchQueue.main.async {
            self.upcomingEvents_collectionView.reloadData()
        }
        
    }
    
    func postError_upcomingView(error: Error) {
        addAlert(title: "Alert!", message: "\(error.localizedDescription)", ActionTitle: "OK", viewController: self)
    }
    
    
    func render_LatestResultView(events: [Event]) {
        self.latestResult = events
        DispatchQueue.main.async {
            self.latestResults_collectionView.reloadData()
        }
    }
    
    func postError_LatestResultView(error: Error) {
        addAlert(title: "Alert!", message: "\(error.localizedDescription)", ActionTitle: "Cancle", viewController: self)
    }
    
    
    func render_TeamsView(teams: [Team]) {
        self.teams = teams
        DispatchQueue.main.async {
            self.teams_collectionView.reloadData()
        }
    }
    
    func postError_TeamsView(error: Error) {
        addAlert(title: "Alert!", message: "\(error.localizedDescription)", ActionTitle: "Cancle", viewController: self)
    }
    
}






//MARK: -                               CollectionView  Protocols


extension LeagueDetails_TableViewController:UICollectionViewDelegate{
    
}

extension LeagueDetails_TableViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {

        case teams_collectionView:
            return teams.count

        case latestResults_collectionView:
            return latestResult.count

        case upcomingEvents_collectionView:
            return upcomingEvents.count

        default:
            return 10
        }

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case teams_collectionView:
            let cell = teams_collectionView.dequeueReusableCell(withReuseIdentifier: Constants.teams_collectionView_identifier, for: indexPath) as! Teams_CollectionViewCell
            cell.setCell(team: teams[indexPath.row])
            return cell
            
        case latestResults_collectionView:
            let cell = latestResults_collectionView.dequeueReusableCell(withReuseIdentifier: Constants.latestResults_collectionView_identifier, for: indexPath) as! LatestResults_CollectionViewCell
            cell.setCell(event: latestResult[indexPath.row])
            return cell
            
        case upcomingEvents_collectionView:
            let cell = upcomingEvents_collectionView.dequeueReusableCell(withReuseIdentifier: Constants.upcomingEvent_collectionView_identifier, for: indexPath) as! UpcomingEvent_CollectionViewCell
            cell.setCell(event: upcomingEvents[indexPath.row])
            return cell
            
        default:
            print("error1")
            return UICollectionViewCell()
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let teamDetailsVC = storyboard?.instantiateViewController(withIdentifier: Constants.teamDetailsViewController_ID) as? TeamDetailsViewController{
            if indexPath.row < teams.count{
                teamDetailsVC.team = teams[indexPath.row]
                teamDetailsVC.modalPresentationStyle = .fullScreen
                self.present(teamDetailsVC, animated: true, completion: nil)
            }
        }
    }
    
}

extension LeagueDetails_TableViewController:UICollectionViewDelegateFlowLayout{
    // to set only one cell in row
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // make only two cell in same row
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }


}



//MARK: -   CoreData Protocols


extension LeagueDetails_TableViewController: ILeagueDetails_view_CoreData{
   
    func savedIn_CoreData() {
        addAlert(title: "Done", message: "changes saved", ActionTitle: "OK", viewController: self)
    }
    
    func saveFailed_CoreData(error: Error) {
        addAlert(title: "Alert!", message: "\(error.localizedDescription)", ActionTitle: "Cancle", viewController: self)
    }
    
    
}



//MARK: -                                           cells register


extension LeagueDetails_TableViewController {
    
    func registerCells() {
        // teams collectionView
        self.teams_collectionView.delegate   = self
        self.teams_collectionView.dataSource = self
        self.teams_collectionView.register(UINib(nibName: Constants.teams_nib_name, bundle: nil), forCellWithReuseIdentifier: Constants.teams_collectionView_identifier)
        
        // LatestResults collectionView
        self.latestResults_collectionView.delegate   = self
        self.latestResults_collectionView.dataSource = self
        latestResults_collectionView.register(UINib(nibName: Constants.latestResults_nib_name, bundle: nil), forCellWithReuseIdentifier: Constants.latestResults_collectionView_identifier)
        
        // upcomingEvents collectionView
        self.upcomingEvents_collectionView.delegate   = self
        self.upcomingEvents_collectionView.dataSource = self
        upcomingEvents_collectionView.register(UINib(nibName: Constants.upcomingEvent_nib_name, bundle: nil), forCellWithReuseIdentifier: Constants.upcomingEvent_collectionView_identifier)
    }
    
}
