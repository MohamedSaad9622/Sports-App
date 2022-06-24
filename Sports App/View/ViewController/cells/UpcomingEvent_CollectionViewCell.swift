//
//  UpcomingEvent_CollectionViewCell.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import UIKit
import SDWebImage

class UpcomingEvent_CollectionViewCell: UICollectionViewCell {

   
    @IBOutlet weak var eventTime_label: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var awayTeam_label: UILabel!
    @IBOutlet weak var homeTeam_lable: UILabel!
    @IBOutlet weak var event_imageView: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(event: Event) {
        self.eventTime_label.text = event.strTime
        self.date.text = event.dateEvent
        self.awayTeam_label.text = event.strAwayTeam
        self.homeTeam_lable.text = event.strHomeTeam
        self.event_imageView.sd_setImage(with: URL(string: event.strThumb), placeholderImage: UIImage(named: Constants.placeHolder_image))
    }
    
}
