//
//  WriteCommentModel.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 6..
//  Copyright © 2017년 김민수. All rights reserved.
//
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

//멀티파트 예외처리 파싱은 SwiftyJSON 이용해서하기

class WriteCommentModel : NetworkModel {
   
    
    func writeComment(id:Int, writer:String, content:String){
        
        let URL = "\(baseURL)/posts/\(id)"
        
        let body : [String:String] = [
            
            "userId" : writer,
            "content" : content
            
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            
            (response : DataResponse<BoardListVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let Message = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if Message.message == "Succeed in writing a comment"{
                  
                    self.view.networkResult(resultData: "댓글작성완료", code: "commentSuccess")
        
                }else if Message.message == "syntax error : [에러원인]"{
                
                    self.view.networkResult(resultData: "[에러원인]", code: "serverError")
                
                }
                else if Message.message ==  "please input all of content, userId"{
                    self.view.networkResult(resultData: "please input all of content, userId", code: "commentError")
                }
                
                
            case .failure(let err):
                self.view.networkFailed()
            }//switch
        }//Alamofire
        
    }
}
