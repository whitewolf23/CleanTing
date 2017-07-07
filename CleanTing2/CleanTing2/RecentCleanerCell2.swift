//
//  RecentCleanerCell2.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 1..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit

class RecentCleanerCell2 : UICollectionViewCell{
    
    @IBOutlet weak var imageview: CustomImageView!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var star_rating: StarRatingControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.white
        
        
        // Initialization code
        //        ratingBar.rating = 4
        //        imageView.image = UIImage(named: "maxresdefault")
    }
    
    
    
}
