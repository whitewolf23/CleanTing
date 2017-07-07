//
//  TingRegionVO.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 6..
//  Copyright © 2017년 김민수. All rights reserved.
//


//"tingId": 59,
//"date": "2017-07-05",
//"startTime": "13:00",
//"endTime": "16:00",
//"cnt": "2",
//"cleanerId": "jiwon",

//"name": "김지원",
//"phone": "010-3333-3333",
//"age": 26,
//"career": 3,
//"area": "노원구 중계동",
//"rate": 5,

//"review_cnt": 1,
//"activity_cnt": null,
//"image": "https://hatemush.s3.ap-northeast-2.amazonaws.com/1499095410202.png",
//"distance": 0
//


import ObjectMapper


class TingRegionVO: Mappable {

    
    var tingId: String?
    var date: String?
    var startTime: String?
    var endTime: String?
  
    //person
    var cnt: String?
    
    var cleanerId: String?

    var name: String?
    var phone: String?
    var age : Int?
    var career: Int?
    var area: String?
    var rate: Int?

    var price: Int?
    var request: Int?
    var warning: String?
   
    
   //리뷰, 20명
    var review_cnt: Int?
    //활동건수
    var activity_cnt: Int?
    var image: String?
    
    //거리
    var distance : Int?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        self.cleanerId <- map["cleanerId"]
        self.tingId <- map["tingId"]
        self.date <- map["date"]
        self.startTime <- map["startTime"]
        self.endTime <- map["endTime"]
        self.cnt <- map["cnt"]
        
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
        
        self.distance <- map["distance"]

                print("=========================")
//                print("유저 아이디 : \(userId!)")
//                print("유저 이름 : \(name!)")
//                print("폰 번호 : \(phone!)")
//                print("주소 : \(address!)")
//                print("푸시 알람 여부 : \(push!)")
//                print("로컬넘버: \(locationNum!)")
                print("위도 : \(gsno(cnt))")
                print("지역: \(gsno(area))")
                print("=========================")

    }
}
