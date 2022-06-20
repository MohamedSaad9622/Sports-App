//
//  Teams_CollectionViewCell.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import UIKit

class Teams_CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var team_imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell() {
        self.team_imageView.image = UIImage(named: "women.jpeg")
    }

}

