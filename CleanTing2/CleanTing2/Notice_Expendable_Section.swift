//
//  NoticeExpandable.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 4..
//  Copyright © 2017년 김민수. All rights reserved.
//

import Foundation

struct Notice_Expendable_Section {
    
    var title : String!
    //    var next_title : String!
    var data : [String]!
    var expendable : Bool!
    
    
    var numberOfItems:Int{
        return data.count
    }
    
    subscript(index:Int) -> String{
        return data[index]
    }
    
    //expendable -> true 오픈
    //expendable -> false 열림
    init(title : String, data : String..., expendable : Bool) {
        self.title = title
        //        self.next_title = next_title
        self.data = data
        self.expendable = expendable
        
        
    }
    
}
