//
//  LeagueDetails_ViewController.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import UIKit

class LeagueDetails_ViewController: UIViewController {

    @IBOutlet weak var teams_collectionView: UICollectionView!
    @IBOutlet weak var LatestResults_collectionView: UICollectionView!
    @IBOutlet weak var upcomingEvents_collectionView: UICollectionView!
    @IBOutlet weak var addToFavorite_button: UIBarButtonItem!
    
    @IBOutlet weak var noUpcomingEvent_label: UILabel!
    var leagueID:String = ""
    var upcomingEvents:[Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // teams collectionView
        self.teams_collectionView.delegate   = self
        self.teams_collectionView.dataSource = self
        self.teams_collectionView.register(UINib(nibName: Constants.teams_nib_name, bundle: nil), forCellWithReuseIdentifier: Constants.teams_collectionView_identifier)
        
        // LatestResults collectionView
        self.LatestResults_collectionView.delegate   = self
        self.LatestResults_collectionView.dataSource = self
        LatestResults_collectionView.register(UINib(nibName: Constants.latestResults_nib_name, bundle: nil), forCellWithReuseIdentifier: Constants.latestResults_collectionView_identifier)
        
        // upcomingEvents collectionView
        self.upcomingEvents_collectionView.delegate   = self
        self.upcomingEvents_collectionView.dataSource = self
        upcomingEvents_collectionView.register(UINib(nibName: Constants.upcomingEvent_nib_name, bundle: nil), forCellWithReuseIdentifier: Constants.upcomingEvent_collectionView_identifier)
        
        let leagueDetails_presenter : ILeagueDetails_presenter = LeagueDetails_presenter(leagueDetails_view: self)
        leagueDetails_presenter.fetchEvents(leagueID: leagueID)
        
    }

    @IBAction func goBack_button(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToFavorite_button(_ sender: UIBarButtonItem) {
        if self.addToFavorite_button.image == UIImage(systemName: "heart.fill") {
            self.addToFavorite_button.image = UIImage(systemName: "heart")
        }else{
            self.addToFavorite_button.image = UIImage(systemName: "heart.fill")
        }
        print("Added^^^^^^^^^^^^^^^^^^^^")
    }
}

//MARK: - ILeagueDetails_view Protocol

extension LeagueDetails_ViewController: ILeagueDetails_view{
    func render_upcomingView(events: [Event]) {
        self.upcomingEvents = events
        DispatchQueue.main.async {
            self.upcomingEvents_collectionView.reloadData()
        }
        
    }
    
    func postError_upcomingView(error: Error) {
        let alert = UIAlertController(title: "Alert!", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}


//MARK: - CollectionView  Protocols

extension LeagueDetails_ViewController:UICollectionViewDelegate{
    
}

extension LeagueDetails_ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case teams_collectionView:
            return 10
        case LatestResults_collectionView:
            return 20
        case upcomingEvents_collectionView:
            return upcomingEvents.count
        default:
            return 0
        }

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case teams_collectionView:
            let cell = teams_collectionView.dequeueReusableCell(withReuseIdentifier: Constants.teams_collectionView_identifier, for: indexPath) as! Teams_CollectionViewCell
            cell.setCell()
            return cell
            
        case LatestResults_collectionView:
            let cell = LatestResults_collectionView.dequeueReusableCell(withReuseIdentifier: Constants.latestResults_collectionView_identifier, for: indexPath) as! LatestResults_CollectionViewCell
            cell.setCell()
            return cell
            
        case upcomingEvents_collectionView:
            let cell = upcomingEvents_collectionView.dequeueReusableCell(withReuseIdentifier: Constants.upcomingEvent_collectionView_identifier, for: indexPath) as! UpcomingEvent_CollectionViewCell
            cell.setCell(event: upcomingEvents[indexPath.row])
            return cell
            
        default:
            return UICollectionViewCell()
        }
        
    }

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        let storyBoard : UIStoryboard = UIStoryboard(name: Constants.second_storyBoard_name, bundle:nil)
//        let leaguesViewController = storyBoard.instantiateViewController(withIdentifier: Constants.leagues_ViewController_ID) as! LeaguesViewController
//        leaguesViewController.sport = sports_list[indexPath.row].strSport
//        self.navigationController?.pushViewController(leaguesViewController, animated: true)
//
//    }

}

extension LeagueDetails_ViewController:UICollectionViewDelegateFlowLayout{
    // to set only one cell in row
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // make only two cell in same row
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
}

