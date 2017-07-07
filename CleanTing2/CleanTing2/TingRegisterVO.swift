//
//  TingRegisterVO.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 5..
//  Copyright © 2017년 김민수. All rights reserved.
//




//{
//    "message": "사용자가 신청한 팅 조회 성공",
//    "result": [
//    {
//    "cleanerId": "hwang",
//    "tingId": 71,
//    "date": "2017-07-10",
//    "startTime": "10:00",
//    "endTime": "18:00",
//    "cnt": "1", 
//    "userId": "bumma",
//    "price": 35000,
//    "request": 1, 123
//    "warning": "책상 위 택배물 만지지 말아주세요",
//    "name": "황민현",
//    "phone": "010-5699-4788",
//    "age": 23,
//    "career": 14,
//    "area": "서울특별시 강남구 역삼1동",
//    "rate": 0, //star
//    "review_cnt": 0, //  20명
//    "activity_cnt": null, //활동 건수 
//    "image": "https://hatemush.s3.amazonaws.com/1499186658846.jpg"
//    }
//    ]
//}

import ObjectMapper




class TingRegisterVO: Mappable {
    
    var cleanerId: String?
    var tingId: String?
    var date: String?
    var startTime: String?
    var endTime: String?
    var cnt: String?
    
    var userId: String?
    var price: Int?
    var request: Int?
    var warning: String?
    var name: String?
    var phone: String?
   
    var career: Int?
    var area: String?
    var rate: Int?
    var review_cnt: Int?
    var activity_cnt: Int?
    var image: String?
    
    var age : Int?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        self.cleanerId <- map["cleanerId"]
        self.tingId <- map["tingId"]
        self.date <- map["date"]
        self.startTime <- map["startTime"]
        self.endTime <- map["endTime"]
        
        self.cnt <- map["cnt"]
        
        self.userId <- map["userId"]
        self.price <- map["price"]
        self.request <- map["request"]
        self.warning <- map["warning"]
        self.name <- map["name"]
        self.phone <- map["phone"]
        
        self.career <- map["career"]
        self.area <- map["area"]
        self.rate <- map["rate"]
        self.review_cnt <- map["review_cnt"]
        self.activity_cnt <- map["activity_cnt"]
        self.image <- map["image"]
        self.age <- map["age"]


        //유저아이디 저장
//        UserDefaults.standard.set(gsno(userId), forKey: "userId")
        
        print("=========================")
//        print("유저 아이디 : \(userId!)")
//        print("유저 이름 : \(name!)")
//        print("폰 번호 : \(phone!)")
//        print("주소 : \(address!)")
//        print("푸시 알람 여부 : \(push!)")
//        print("로컬넘버: \(locationNum!)")
//        print("위도 : \(gsno(lat))")
        print("참가자: \(gsno(cnt))")
        print("=========================")
        
        
        
    }
    
    
}
