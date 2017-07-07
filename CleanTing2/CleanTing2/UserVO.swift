//
//  UserVO.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 5..
//  Copyright © 2017년 김민수. All rights reserved.
////

import ObjectMapper




class UserVO: Mappable {
    
    var userId: String?
    var name: String?
    var phone: String?
    var address: String?
    var push: Int?
    var locationNum: Int?
    var lat: Double?
    var lng: Double? // float 보다 자리수가 넓어서 double 추천

    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        self.userId <- map["userId"]
        self.name <- map["name"]
        self.phone <- map["phone"]
        self.address <- map["address"]
        self.push <- map["push"]
        self.locationNum <- map["locationNum"]
        self.lat <- map["lat"]
        self.lng <- map["lng"]
        
        //유저아이디 저장
        UserDefaults.standard.set(gsno(userId), forKey: "userId")
        UserDefaults.standard.set(gsno(address), forKey: "address")
        
        //위도 경도
        UserDefaults.standard.set(gdno(lat), forKey: "lat")
        UserDefaults.standard.set(gdno(lng), forKey: "lng")


        //지역번호
        UserDefaults.standard.set(gino(locationNum), forKey: "locationNum")

        print("=========================")
        print("유저 아이디 : \(userId!)")
        print("유저 이름 : \(name!)")
        print("폰 번호 : \(gsno(phone))")
        print("주소 : \(address!)")
        print("푸시 알람 여부 : \(push!)")
        print("로컬넘버: \(gino(locationNum))")
        print("위도 : \(gdno(lat))")
        print("경도: \(gdno(lng))")
        print("=========================")
        
        

    }
    

}
