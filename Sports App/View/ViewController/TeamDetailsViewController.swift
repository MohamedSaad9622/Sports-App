//
//  TeamViewController.swift
//  Sports App
//
//  Created by MAC on 21/06/2022.
//

import UIKit
import SDWebImage


class TeamDetailsViewController: UIViewController {

    @IBOutlet weak private var teamTitle: UILabel!
    @IBOutlet weak private var teamImage: UIImageView!
    @IBOutlet weak private var teamFormatedYear: UILabel!
    @IBOutlet weak private var teamLeague: UILabel!
    @IBOutlet weak private var teamSports: UILabel!
    @IBOutlet weak var teamDiscreption: UILabel!
    @IBOutlet weak var teamWbsite: UIImageView!
    @IBOutlet weak var teamTwitter: UIImageView!
    @IBOutlet weak var teamInstagram: UIImageView!
    @IBOutlet weak var teamYoutube: UIImageView!
    @IBOutlet weak var teamFacebook: UIImageView!
    @IBOutlet weak var teamJersey_imageView: UIImageView!
    @IBOutlet weak var teamStadium_imageView: UIImageView!
    
    
    var team: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTapGestureRecognizer()
        
        if let team = team {
            self.title = team.strTeam
        }
        
        if let team = team {
            
            self.teamTitle.text! = team.strTeam
            self.teamFormatedYear.text! = team.intFormedYear
            self.teamLeague.text! = team.strLeague
            self.teamSports.text! = team.strSport
            self.teamDiscreption.text! = team.strDescriptionEN
            
            
            self.teamImage.sd_setImage(with: URL(string: team.strTeamBadge), placeholderImage: UIImage(named: Constants.placeHolder_image))
            
            
            if let teamJersey = team.strTeamJersey{
                self.teamJersey_imageView.sd_setImage(with: URL(string: teamJersey), placeholderImage: UIImage(named: Constants.placeHolder_image))
            }else{
                self.teamJersey_imageView.image = UIImage(named: Constants.placeHolder_image)
            }
            
            
            if let stadiumThumb = team.strStadiumThumb{
                self.teamStadium_imageView.sd_setImage(with: URL(string: stadiumThumb), placeholderImage: UIImage(named: Constants.placeHolder_image))
            }else{
                self.teamStadium_imageView.image = UIImage(named: Constants.placeHolder_image)
            }
            
            
        }

       
        
    }
                
//MARK: -                Tap Gesture Recognizer   Actions
    
    @objc func website_buttonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
                if let strWebsite = team?.strWebsite{
                    guard let url = URL(string: "https://\(strWebsite)") else { return }
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
        }
    }

    @objc func twitter_buttonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            if let twitter = team?.strTwitter {
                guard let url = URL(string: "https://\(twitter)") else {return}
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    @objc func facebook_buttonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            if let facebook = team?.strFacebook {
                guard let url = URL(string: "https://\(facebook)") else {return}
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    @objc func youtube_buttonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            if let youtube = team?.strYoutube {
                guard let url = URL(string: "https://\(youtube)") else {return}
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    @objc func instegram_buttonTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            if let instegram = team?.strInstagram {
                guard let url = URL(string: "https://\(instegram)") else {return}
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }

    

    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

    
 //MARK: -         Tap Gesture Recognizer
    
    func addTapGestureRecognizer() {
        
        let websiteGesture = UITapGestureRecognizer(target: self, action: #selector(self.website_buttonTapped))
        teamWbsite.addGestureRecognizer(websiteGesture)
        teamWbsite.isUserInteractionEnabled = true
        
        let facebookGesture = UITapGestureRecognizer(target: self, action: #selector(self.facebook_buttonTapped))
        teamFacebook.addGestureRecognizer(facebookGesture)
        teamFacebook.isUserInteractionEnabled = true
        
        let youtubeGesture = UITapGestureRecognizer(target: self, action: #selector(self.youtube_buttonTapped))
        teamYoutube.addGestureRecognizer(youtubeGesture)
        teamYoutube.isUserInteractionEnabled = true
        
        
        let twitterGesture = UITapGestureRecognizer(target: self, action: #selector(self.twitter_buttonTapped))
        teamTwitter.addGestureRecognizer(twitterGesture)
        teamTwitter.isUserInteractionEnabled = true
        
        
        let instagramGesture = UITapGestureRecognizer(target: self, action: #selector(self.instegram_buttonTapped))
        teamInstagram.addGestureRecognizer(instagramGesture)
        teamInstagram.isUserInteractionEnabled = true
    }
    
}

