//
//  TingRegionModel.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 6..
//  Copyright © 2017년 김민수. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON


class TingRegionModel : NetworkModel {
    
    
    //파라미터 부분 봐꿔여야함
    func getTingRegionList(userId : String ,userLat:Double, userLng:Double){
        
        let userID = userId
        let LAT = userLat
        let LNG = userLng
        print(" 팅 지역 모델 - 받은 유저 아이디 값 : \(userId)")
        print(" 팅 지역 모델 - 받은 위도 값 : \(userLat)")
        print(" 팅 지역 모델 - 받은 경도 값 : \(userLng)")

        
        let URL : String = "\(baseURL)/ting/area/\(userID)"
        print("팅 지역 모델 - URL : \(URL)")

        let body : [String : Double] = [
            
            
            "userLat": LAT,
            "userLng": LNG
            
        ]
        
//        
//        let headers : [String : String] = [
//            
//            
//            "token": token,
//            "Content-Type": "application/json"
//            
//        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<TingRegionListVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let list = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if list.message == "OK" {
                    print("연결 성공")
                    
                    if let results = list.result {
                        self.view.networkResult(resultData: results, code: "tingRegionSuccess")
                        
                    }
                }
                    
                else if list.message == "server error : 에러원인" {
                    
                    self.view.networkResult(resultData: "에러원인", code: "serverError")
                    
                }else if list.message == "order header data err"{
                    
                    self.view.networkResult(resultData: "에러원인", code: "headerError")
              
                }else if list.message == "no token"{
                    
                    self.view.networkResult(resultData: "에러원인", code: "tokenError")
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }//getBoardList
    
    
    /*********************************************************************************/
    
}
