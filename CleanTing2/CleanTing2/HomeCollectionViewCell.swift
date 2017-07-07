//
//  HomeCollectionViewCell.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 27..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit

class HomeCollectionViewCell : UICollectionViewCell{
   
    
    @IBOutlet weak var CleanerName: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var personRating: PersonRatingControl!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var startime: UILabel!
    
    @IBOutlet weak var endtime: UILabel!

    @IBOutlet weak var person_num : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.backgroundColor = UIColor.white

        // Initialization code
        //        ratingBar.rating = 4
        //        imageView.image = UIImage(named: "maxresdefault")
    }

}
