//
//  UserListVO.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 5..
//  Copyright © 2017년 김민수. All rights reserved.
//
//{
//    "message": "ok",
//    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJidW1tYSIsImlhdCI6MTQ5OTIyOTc5MiwiZXhwIjoxNTAxODIxNzkyfQ.ZMvzFXsjcbK7V-nreaSL4--MrfXIe_z7BaL6iLTUqgI",
//    "userInfo": {
//        "userId": "bumma",
//        "name": "김범진",
//        "phone": "010-2222-2222",
//        "address": "서울특별시 관악구 신림동",
//        "push": 1,
//        "locationNum": 1,
//        "lat": null,
//        "lng": null
//    }
//}




import ObjectMapper



class UserListVO : Mappable{
    
    var message : String?
    var token : String?
    
//    var userInfo : [UserVO]? // []

    var userInfo : UserVO? // {}
    
    //json 객체가 배열로 오는 객체로 오는 지 확인해야함 .
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
      
        message <- map["message"]
        token <- map["token"]
        userInfo <- map["userInfo"]
        
        //토큰 저장 
        UserDefaults.standard.set(gsno(token), forKey: "token")
        
        
        print("=========================")
        print("메세지 여부 : \(gsno(message))")
        print("토큰 값 : \(gsno(token))")
//        print("유저정보 : \(userInfo!)")
        print("=========================")
        
        
    }
}
