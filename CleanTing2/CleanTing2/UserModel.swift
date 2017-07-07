//
//  UserModel.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 5..
//  Copyright © 2017년 김민수. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper



class UserModel : NetworkModel {
    
    
    //1-1
    //로그인 후 유저정보 받기
    //52.79.221.92:3000/posts/?locationNum=1 로 수정중
    func getUserInfo(userId:String, pwd:String){
        
        let URL : String = "\(baseURL)/members/login"
        
        let body : [String:String] = [
            
            
            "userId":userId,
            "pwd": pwd
            
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            //변경할 부분
            (response : DataResponse<UserListVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let userlist = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                //변경할 부분
                if userlist.message == "ok" {
                    print("연결 성공")
                    
                    //유저vo 에 파라미터 연결 부분
                    if let userInfo = userlist.userInfo {
                        self.view.networkResult(resultData: userInfo, code: "loginSucces")
                        
                    }
                }
                    
                //에러 처리
                else if userlist.message == "server err: TypeError: Cannot read property 'pwd' of undefined" {
                    //로그인 에러 1
                    self.view.networkResult(resultData: "TypeError: Cannot read property 'pwd' of undefined", code: "loginError")
                }
                
                else if userlist.message == "wrong email or password"{
                    
                    //로그인 에러 2
                    self.view.networkResult(resultData: "wrong email or password", code: "loginError2")
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }//getBoardList
    
}



//struct UserService {
//
//    static func info(_ completion: @escaping (DataResponse<UserVO>) -> Void) {
//        let urlString = "http://117.16.191.242:8080/stuinfo"
//        let headers: HTTPHeaders = [
//            "Accept": "application/json",
//            ]
//        Alamofire
//            .request(urlString, method: .get, headers: headers)
//            .validate(statusCode: 200..<400)
//            .responseJSON{ response in
//                let response: DataResponse<UserVO> = response.flatMap { json in
//                    print("결과")
//                    print(response.result)
//
//                    if let user = Mapper<UserVO>().mapArray(JSONArray: json as! [[String : Any]]) {
//
//                        return .success(user[0])
//                    } else {
//                        let error = MappingError(from: json, to: UserVO.self)
//                        return .failure(error)
//                    }
//                }
//                completion(response)
//        }
//
//    }
//
//}
