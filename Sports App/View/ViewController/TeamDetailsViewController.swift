//
//  TeamViewController.swift
//  Sports App
//
//  Created by MAC on 21/06/2022.
//

import UIKit
import SDWebImage


class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var teamTitle: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamFormatedYear: UILabel!
    @IBOutlet weak var teamLeague: UILabel!
    @IBOutlet weak var teamSports: UILabel!
    @IBOutlet weak var teamDiscreption: UILabel!

    
    
    var team: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let team = team {
            self.title = team.strTeam
        }
        
        if let team = team {
            self.teamTitle.text = team.strTeam
            self.teamFormatedYear.text = team.intFormedYear
            self.teamLeague.text = team.strLeague
            self.teamSports.text = team.strSport
            self.teamDiscreption.text = team.strDescriptionEN
            self.teamImage.sd_setImage(with: URL(string: team.strTeamBadge), placeholderImage: UIImage(named: "women.jpeg"))
        }
    }


    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func website(_ sender: UIButton) {
        if let strWebsite = team?.strWebsite{
            guard let url = URL(string: "https://\(strWebsite)") else { return }
            print("$$$$$$$$$$$$\(url)")
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    

    @IBAction func twitterButton(_ sender: Any) {
        if let twitter = team?.strTwitter {
            guard let url = URL(string: "https://\(twitter)") else {return}
            print("$$$$$$$$$$$$\(url)")
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    @IBAction func facebookButton(_ sender: Any) {
        if let facebook = team?.strFacebook {
            guard let url = URL(string: "https://\(facebook)") else {return}
            print("$$$$$$$$$$$$\(url)")
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    @IBAction func youtubeButton(_ sender: Any) {
        if let youtube = team?.strYoutube {
            guard let url = URL(string: "https://\(youtube)") else {return}
            print("$$$$$$$$$$$$\(url)")
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    @IBAction func instegram(_ sender: Any) {
        if let instegram = team?.strInstagram {
            guard let url = URL(string: "https://\(instegram)") else {return}
            print("$$$$$$$$$$$$\(url)")
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    
}
