//
//  BoardDetailModel.swift
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

class BoardDetailModel : NetworkModel {
    
    func getBoardDetail(id:Int){
        
        let URL : String = "\(baseURL)/posts/\(id)"
//        let URL : String = "\(baseURL)/posts/12"

        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<BoardDetailVO>) in
            
            print(response.result)
            switch response.result{
                
            case .success:
                
                guard let boardDetail = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                //게시물 상세보기 가져오기 성공
                
                if boardDetail.message == "게시물 상세조회에 성공하였습니다."{
//                    print(boardDetail.result?.post?.title)
                    if let post = boardDetail.result?.post {
                        self.view.networkResult(resultData: post, code: "board2")
                    }
                    if let commentList = boardDetail.result?.comment{
                        self.view.networkResult(resultData: commentList, code: "comment")
                    }
              
                
                }
                    
                    //게시물 상세보기 갸져오기 실패(예외)
                else if boardDetail.message == "syntax error : [에러원인]"{
                    self.view.networkResult(resultData: "[에러원인]", code: "boardError")
                }
                
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
                
                
            }
            
        }
        
    }//getBoardDetail
    
}
