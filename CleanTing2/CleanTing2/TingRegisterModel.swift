//
//  TingRegisterModel.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 5..
//  Copyright © 2017년 김민수. All rights reserved.
//


import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON


class TingRegisterModel : NetworkModel {
    
    
    //파라미터 부분 봐꿔여야함
    func getTingRegisterList(userId : String){
        
        let userID = userId
        print(" 팅 모델 - 받은 유저 아이디 값 : \(userId)")
        let URL : String = "\(baseURL)/ting/register/\(userID)"
//        let URL : String = "\(baseURL)/ting/register/bumma"

        print("팅 모델 - URL : \(URL)")
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<TingRegisterListVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let list = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if list.message == "사용자가 신청한 팅 조회 성공" {
                    print("연결 성공")
                    
                    if let results = list.result {
                        self.view.networkResult(resultData: results, code: "tingReigster")
                        
                    }
                }
                    
                else if list.message == "server error : 에러원인" {
                    
                    self.view.networkResult(resultData: "에러원인", code: "tingRegisterError")
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }//getBoardList
    
    
    /*********************************************************************************/
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
