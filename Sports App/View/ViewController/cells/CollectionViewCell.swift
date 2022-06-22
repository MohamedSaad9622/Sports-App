//
//  CollectionViewCell.swift
//  Sports App
//
//  Created by MAC on 18/06/2022.
//

import UIKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var sports_cell_image: UIImageView!
    @IBOutlet weak private var sports_cell_title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(image:String, title:String) {
        sports_cell_title.text = title
        sports_cell_image.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "women.jpeg"))

    }

    

}
