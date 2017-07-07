//
//  LatelyModel.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 7..
//  Copyright © 2017년 김민수. All rights reserved.
// 52.79.221.92:3000/cleaner/lately/bumma



import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON


class LatelyModel : NetworkModel {
    
    
    //파라미터 부분 봐꿔여야함
    func getCleanerLately(userId : String){
        
        let userID = userId
        print(" 팅 모델 - 받은 유저 아이디 값 : \(userId)")
        let URL : String = "\(baseURL)/cleaner/lately/\(userID)"
        //        let URL : String = "\(baseURL)/ting/register/bumma"
        
        print("팅 모델 - URL : \(URL)")
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<MessageVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let list = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if list.message == "클리너 최근이용순으로 정렬 성공" {
                    print("연결 성공")
                    
                    if let results = list.result {
                        self.view.networkResult(resultData: results, code: "SUCESS")
                        
                    }
                }
                    
                else if list.message == "server error : 에러원인" {
                    
                    self.view.networkResult(resultData: "에러원인", code: "ERROR")
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }//getBoardList
}
    
