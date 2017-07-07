//
//  BoardListVO.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 3..
//  Copyright © 2017년 김민수. All rights reserved.
//

import ObjectMapper



class BoardListVO : Mappable{
    
    var message : String?
    var result : [BoardVO]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        message <- map["message"]
        result <- map["result"]
    }
}
