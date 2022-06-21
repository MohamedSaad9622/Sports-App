//
//  Teams_CollectionViewCell.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import UIKit
import SDWebImage

class Teams_CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var team_imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(team:Team) {
        self.team_imageView.sd_setImage(with: URL(string: team.strTeamBadge), placeholderImage: UIImage(named: "women.jpeg"))
        print("%%%%%%%%%%image : \(team.strTeamBadge)")
    }

}

