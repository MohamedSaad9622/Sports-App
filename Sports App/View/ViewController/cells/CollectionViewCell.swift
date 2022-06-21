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
//        if sports_cell_image.frame.size.height > sports_cell_image.frame.size.width{
//            sports_cell_image.layer.cornerRadius = (sports_cell_image.frame.size.width ?? 0.0) / 2.7
//        }else{
//            sports_cell_image.layer.cornerRadius = (sports_cell_image.frame.size.height ?? 0.0) / 2.7
//        }
//        
//        sports_cell_image.clipsToBounds = true
//        sports_cell_image.layer.borderWidth = 3.0
//        sports_cell_image.layer.borderColor = UIColor.white.cgColor
        
    }
    
    func setCell(image:String, title:String) {
        sports_cell_title.text = title
        sports_cell_image.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "women.jpeg"))

    }

    

}
