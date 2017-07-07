//
//  BoardViewTableCell.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 28..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit

class BoardViewTableCell : UITableViewCell{
    
    
    @IBOutlet weak var b_Title: UILabel!
    @IBOutlet weak var b_Content: UILabel!
    @IBOutlet weak var b_Date: UILabel!
    @IBOutlet weak var b_Comment_count: UILabel!
    @IBOutlet weak var b_time: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //
        b_Title.font = UIFont(name: "", size: 17.0)
        
        //
        b_Content.font = UIFont(name: "", size: 15.0)
        b_Content.textColor = UIColor.init(hex: 0x333333)


//
//        b_Title =//        b_Content = UILabel(name: "nanumsquare", size: 8.0)


        
        //셀 배경색
        self.backgroundColor = UIColor.white
//        b_Content.layer.borderWidth = 3.0
//        b_Content.layer.borderColor = UIColor.blue.cgColor
        
        // Initialization code
        //        ratingBar.rating = 4
        //        imageView.image = UIImage(named: "maxresdefault")
    }
    
    
}
