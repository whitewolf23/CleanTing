//
//  CreateTingCell.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 29..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit

class CreateTingCell : UICollectionViewCell{
    
    
    @IBOutlet weak var createTing: CustomButton!
  
    @IBAction func createTing(_ sender: UIButton) {
        print("팅 만들기")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.backgroundColor = UIColor.init(hex: 0xF2D457)
        
        
        // Initialization code
        //        ratingBar.rating = 4
        //        imageView.image = UIImage(named: "maxresdefault")
    }
    
}
