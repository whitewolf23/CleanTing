//
//  BoardDetailCell.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 6..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit

class BoardDetailCell : UITableViewCell{
    
    
    @IBOutlet weak var content : UILabel!
    @IBOutlet weak var d_userid : UILabel!
    @IBOutlet weak var date : UILabel!
    @IBOutlet weak var time : UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
}
