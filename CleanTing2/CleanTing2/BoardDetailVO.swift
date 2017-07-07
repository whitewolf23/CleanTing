//
//  BoardDetailVO.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 6..
//  Copyright © 2017년 김민수. All rights reserved.
//

import ObjectMapper



class BoardDetailVO : Mappable{
    
    var message : String?
    var result : ResultVO?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        message <- map["message"]
        result <- map["result"]
    }
}
