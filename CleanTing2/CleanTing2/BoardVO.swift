//
//  BoardVO.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 3..
//  Copyright © 2017년 김민수. All rights reserved.
//

import ObjectMapper

//postId : 게시글 고유 아이디
//userId : 작성자이름 혹은 아이디
//title : 게시글 제목
//view_number : 조회수
//date, time: 작성시간


//"postId": 4,
//"userId": "minsu",
//"title": "1+1같이사요",
//"content": "락앤락1+1 같이구매하실분구해요.",
//"view_number": 0,
//"date": "2017-07-01",
//"time": "11:18:01 am",
//"comment_cnt": 0


class BoardVO : Mappable{
    
    var postId : Int?
    var userId : String?
    var title : String?
    var view_number : Int?
    var content : String?
    var date : String?
    var time : String?
    var comment_cnt : Int?
    var locationNum : Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        postId <- map["postId"]
        userId <- map["userId"]
        title <- map["title"]
        view_number <- map["view_number"]
        content <- map["content"]
        date <- map["date"]
        time <- map["time"]
        comment_cnt <- map["comment_cnt"]
        locationNum <- map["locationNum"]


        
        print("=========================")
        print("게시글 번호 : \(postId!)")
        print("유저 아이디 : \(userId!)")
        print("제목 : \(title!)")
        print("조회 수 : \(view_number!)")
        print("날짜 : \(date!)")
        print("시간 : \(time!)")
        print("댓글 수 : \(comment_cnt!)")
        print("지역 번호 : \(locationNum!)")

        print("=========================")

        
    }
    
}
