//
//  NetworkResult.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 3..
//  Copyright © 2017년 김민수. All rights reserved.
//

protocol NetworkCallback {
    func networkResult(resultData:Any, code:String)
    func networkFailed()
}
