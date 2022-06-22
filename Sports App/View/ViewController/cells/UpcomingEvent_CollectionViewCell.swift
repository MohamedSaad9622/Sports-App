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

    func setCell(event: Event) {
        self.eventName_label.text = event.strEvent
        self.eventDate_label.text = event.dateEvent
        self.eventTime_label.text = event.strTime
    }
    
}
