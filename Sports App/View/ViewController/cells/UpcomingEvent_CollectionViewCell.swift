//
//  UpcomingEvent_CollectionViewCell.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import UIKit

class UpcomingEvent_CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var eventTime_label: UILabel!
    @IBOutlet weak private var eventDate_label: UILabel!
    @IBOutlet weak private var eventName_label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell() {
        self.eventName_label.text = "mohamed event"
        self.eventDate_label.text = "21-6-2022"
        self.eventTime_label.text = "12:23 PM"
    }
    
}
