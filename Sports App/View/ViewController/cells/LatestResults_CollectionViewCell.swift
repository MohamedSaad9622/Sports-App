//
//  LatestResults_CollectionViewCell.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import UIKit

class LatestResults_CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var firstTeam_label: UILabel!
    @IBOutlet weak private var secondTeamName_label: UILabel!
    @IBOutlet weak private var firstScore_label: UILabel!
    @IBOutlet weak private var secondScore_label: UILabel!
    @IBOutlet weak private var date_label: UILabel!
    @IBOutlet weak private var time_label: UILabel!
    @IBOutlet weak var event_imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(event: Event) {
        self.firstTeam_label.text = event.strHomeTeam
        self.secondTeamName_label.text = event.strAwayTeam
        self.firstScore_label.text = event.intHomeScore
        self.secondScore_label.text = event.intAwayScore
        self.date_label.text = event.dateEvent
        self.time_label.text = event.strTime
        self.event_imageView.sd_setImage(with: URL(string: event.strThumb), placeholderImage: UIImage(named: Constants.placeHolder_image))

    }
   

}
