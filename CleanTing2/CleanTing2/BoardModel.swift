//
//  BoardModel.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 3..
//  Copyright © 2017년 김민수. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON


class BoardModel : NetworkModel {


    //1-1
    //전체 게시글 조회
    //52.79.221.92:3000/posts/?locationNum=1 로 수정중 
    func getBoradList(){
        
        let URL : String = "\(baseURL)/posts/?locationNum=1"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<BoardListVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let boardList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                //게시글 리스트 가져오기 성공
                if boardList.message == "전체게시글 조회에 성공하였습니다" {
                    print("연결 성공")

                    if let results = boardList.result {
                        self.view.networkResult(resultData: results, code: "board")

                    }
                }
                    
                    //게시글 리스트 가져오기 실패(예외)
                else if boardList.message == "syntax error :  [에러원인]" {
                    
                    self.view.networkResult(resultData: "[에러원인]", code: "board-selecting post error")
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }//getBoardList
    
    
    /*********************************************************************************/
    
}
