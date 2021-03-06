//
//  SportsViewController.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import UIKit

class SportsViewController: UIViewController {

    @IBOutlet weak var sports_collectionView: UICollectionView!
    
    var sports_list: [Sport] = []
    var numberOfCellsInColumn = 3
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sports_collectionView.register(UINib(nibName: Constants.sports__nib_name, bundle: nil), forCellWithReuseIdentifier: Constants.sports_collectionCell_identifier)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        let sportsPresenter : ISportsPresenter = Sports_presenter(sportsView: self)
        sportsPresenter.fetchSports(url: Constants.sports_url_string)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)
            if UIDevice.current.orientation.isLandscape {
                numberOfCellsInColumn = 1
            }else{
                numberOfCellsInColumn = 3
            }
        }
    
}


//MARK: - ISportsView protocol

extension SportsViewController: ISportsView{
    
    func render_SportsView(sports: [Sport]) {
        
        self.sports_list = sports
        
        DispatchQueue.main.async {
            self.sports_collectionView.reloadData()
        }
    }
    
    func postError(error: Error) {
        addAlert(title: "Alert!", message: "\(error.localizedDescription)", ActionTitle: "cancel", viewController: self)
    }
    
    
}


//MARK: - Collection View

extension SportsViewController:UICollectionViewDelegate{
    
}

extension SportsViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports_list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.sports_collectionCell_identifier, for: indexPath) as! CollectionViewCell
        
        cell.setCell(image:sports_list[indexPath.row].strSportThumb , title: sports_list[indexPath.row].strSport )

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: Constants.second_storyBoard_name, bundle:nil)
        let leaguesViewController = storyBoard.instantiateViewController(withIdentifier: Constants.leagues_ViewController_ID) as! LeaguesViewController
        leaguesViewController.sport = sports_list[indexPath.row].strSport
        self.navigationController?.pushViewController(leaguesViewController, animated: true)
        
    }
    
}


extension SportsViewController:UICollectionViewDelegateFlowLayout{
    // to set only two cell in row
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2, height: collectionView.bounds.height / CGFloat(numberOfCellsInColumn))
    }

    
    
}
