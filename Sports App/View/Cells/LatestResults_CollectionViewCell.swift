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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell() {
        self.firstTeam_label.text = "first team"
        self.secondTeamName_label.text = "second team"
        self.firstScore_label.text = "10"
        self.secondScore_label.text = "1"
        self.date_label.text = "10-2-2022"
        self.time_label.text = "12:00 AM"
    }

}
