//
//  ResultVO.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 6..
//  Copyright © 2017년 김민수. All rights reserved.
//


import Foundation
import ObjectMapper

class ResultVO : Mappable{
    
    //게시글 클래스를 받아온다.
    var post : BoardVO?
    
    //댓글
    var comment : [CommentVO]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        post <- map["post"]
        comment <- map["comment"]
    }
}
