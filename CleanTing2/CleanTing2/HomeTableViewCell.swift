//
//  HomeTableViewCell.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 28..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit

class HomeTableViewCell : UITableViewCell{



    @IBOutlet weak var imageview: CustomImageView!


    @IBOutlet weak var date: UILabel!
    
    
    @IBOutlet weak var start_time: UILabel!
    
    
    @IBOutlet weak var end_time: UILabel!
    
    
    @IBOutlet weak var person_num: PersonRatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.white
        
        
    }


}
