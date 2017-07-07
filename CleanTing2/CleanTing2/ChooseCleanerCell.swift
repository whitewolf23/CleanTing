//
//  ChooseCleanerCell.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 1..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit

class ChooseCleanerCell: UITableViewCell{
    
    
    
    @IBAction func choose_action(_ sender: Any) {
        print("직접선택")
        
        
        
    }
    
    
    
    
    
    @IBOutlet weak var name : UILabel!
    
    @IBOutlet weak var choose_cleaner: UIButton!
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var star_rating: StarRatingControl!
   
    @IBOutlet weak var age: UILabel!
    
    @IBOutlet weak var activity: UILabel!
  
    @IBOutlet weak var career: UILabel!
    
    @IBOutlet weak var review: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
}
