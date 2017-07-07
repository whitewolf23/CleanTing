//
//  MessageVO.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 7..
//  Copyright © 2017년 김민수. All rights reserved.
//

import ObjectMapper



class MessageVO : Mappable{
    
    var message : String?
    var result : [CleanerLatelyVO]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        message <- map["message"]
        result <- map["result"]
        
        
        
        print("=========================")
        print("메세지 여부 : \(gsno(message))")
        print("=========================")
        
    }
    
}
