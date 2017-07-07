//
//  CleanerLatelyVO.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 7..
//  Copyright © 2017년 김민수. All rights reserved.
//


import ObjectMapper
//{
//    "message": "클리너 최근이용순으로 정렬 성공",
//    "result": [
//    {
//    "cleanerId": "bumjin",
//    "name": "김범진",
//    "phone": "010-2222-2222",
//    "age": 25,
//    "career": 23,
//    "area": "노원구 공릉동",
//    "rate": 0,
//    "review_cnt": 0,
//    "activity_cnt": null,
//    "image": "https://hatemush.s3.amazonaws.com/1499095084229.jpg",
//    "date": "2017-06-29"
//    }
//    ]
//}


class CleanerLatelyVO: Mappable {
    
    
    
    var cleanerId: String?
    var name: String?
    var phone: String?
    var age : Int?
    var career: Int?
    var area: String?
    var rate: Int?

    
    //리뷰, 20명
    var review_cnt: Int?
    //활동건수
    var activity_cnt: Int?
    var image: String?
    
    var date : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        self.cleanerId <- map["cleanerId"]
        self.date <- map["date"]
 
        self.name <- map["name"]
        self.phone <- map["phone"]
        
        self.career <- map["career"]
        self.area <- map["area"]
        self.rate <- map["rate"]
        self.review_cnt <- map["review_cnt"]
        self.activity_cnt <- map["activity_cnt"]
        self.image <- map["image"]
        self.age <- map["age"]
        
        
        print("=========================")
        //                print("유저 아이디 : \(userId!)")
        //                print("유저 이름 : \(name!)")
        //                print("폰 번호 : \(phone!)")
        //                print("주소 : \(address!)")
        //                print("푸시 알람 여부 : \(push!)")
        //                print("로컬넘버: \(locationNum!)")
        print("위도 : \(gsno(name))")
        print("지역: \(gsno(area))")
        print("=========================")
        
    }
}
