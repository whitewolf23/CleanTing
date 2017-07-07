//
//  TingGenrateModel.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 6..
//  Copyright © 2017년 김민수. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

//{
//    "userId": "dmsal",
//    "date": "2017-06-29",
//    "startTime": "13:00",
//    "endTime": "16:00",
//    "price": "13000",
//    "cleanerId": "jiwon",
//    "request": 2,
//    "warning": "얼굴이 비치게 청소해주세여 ",
//    "lat" : "37.495939",
//    "lng":"127.033125"
//}


class TingGenrateModel : NetworkModel {
    
    

    //팅 생성하기
    func generate_Ting(userId:String, date:String, startTime:String, endTime:String,price:String, cleanerId:String, request : Int, warning : String, lat : Double, lng : Double){
        
        let URL : String = "\(baseURL)/ting"
        
        let body : [String : Any] = [
        
                "userId": userId,
                "date": date,
                "startTime": startTime,
                "endTime": endTime,
                "price": price,
                "cleanerId": cleanerId,
                "request": request,
                "warning": warning,
                "lat" : lat,
                "lng": lng
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
            
            
            //변동
            (response : DataResponse<TingGenerateListVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let Message = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if Message.message == "팅 생성 성공"{
                    print("연결 성공")
                    
                        self.view.networkResult(resultData: "성공", code: "tingSuccess")
                        
                
//                    if let results = list.result {
//                        self.view.networkResult(resultData: results, code: "tingSuccess")
//                        
//                    }
                }
                    
                else if Message.message == "server err: + [에러 원인] "{
                    
                    self.view.networkResult(resultData: "에러원인", code: "serverError")
                    
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }//getBoardList
    
    
    /*********************************************************************************/
    
}
