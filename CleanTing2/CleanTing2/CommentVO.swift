//
//  CommentVO.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 6..
//  Copyright © 2017년 김민수. All rights reserved.
//


//"commentId": 54,
//"userId": "bumma",
//"postId": 12,
//"date": "2017-07-04",
//"time": "7:08:34 pm",
//"content": "hjhj"



import ObjectMapper


class CommentVO : Mappable{
    
    
    var commentId : Int?
    var userId : String?
    var postId : Int?
    var date : String?
    var time : String?
    var content : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        commentId <- map["commentId"]
        userId <- map["userId"]
        postId <- map["postId"]
        date <- map["date"]
        time <- map["time"]
        content <- map["content"]
        
        
        print("=========================")
        print("댓글 번호 : \(commentId!)")
        print("유저 아이디 : \(userId!)")
        print("게시글 아이디 : \(postId!)")
        print("날짜 : \(date!)")
        print("시간 : \(time!)")
        print("댓글 내용 : \(content!)")
        
        print("=========================")    }
    
    
}
