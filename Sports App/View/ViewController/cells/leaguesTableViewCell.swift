//
//  leaguesTableViewCell.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import UIKit
import SDWebImage


class leaguesTableViewCell: UITableViewCell {

    @IBOutlet weak private var leagueImage_imageView: UIImageView!
    @IBOutlet weak private var leagueTitle_label: UILabel!

    var league_link:String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    func setCell(league:Country) {
        self.leagueTitle_label.text = league.strLeague
        league_link = "https://\(league.strYoutube)"
        self.leagueImage_imageView.sd_setImage(with: URL(string: league.strBadge), placeholderImage: UIImage(named: "playstore"))
    }
    
    
    @IBAction func league_link(_ sender: UIButton) {
        guard let url = URL(string: league_link) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    

}

