//
//  ApplyRegionViewController.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 28..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit


class ApplyRegionViewController: UIViewController{
    
    @IBOutlet weak var cleaner_name : UILabel!
    @IBOutlet weak var person_rating : PersonRatingControl!
    @IBOutlet weak var star_rating : StarRatingControl!
    
    @IBOutlet weak var imageView : UIImageView!
    
    @IBOutlet weak var start_time : UILabel!
    @IBOutlet weak var end_time : UILabel!
    
    @IBOutlet weak var appy_date : UILabel!
    @IBOutlet weak var warning : UITextField!
    @IBOutlet weak var price : UILabel!
//    @IBOutlet weak var request : UILabel!
    
    @IBOutlet weak var person_num : UILabel!     // 1/3명
    
    @IBOutlet weak var career: UILabel!

    
    
    @IBOutlet weak var activity_cnt : UILabel! //활동 건수
    @IBOutlet weak var review_cnt : UILabel! //  20명
    @IBOutlet weak var review_cnt2 : UILabel! // 21회
    
    @IBOutlet weak var age : UILabel! // 나이
    
    
    
    var CLEANER_NAME : String?
    var PERSON_RATING : Int?
    var STAR_RATING : Int?
    
    var IMAGEVIEW: String?
    
    var START_TIME : String?
    var END_TIME : String?
    
    var APPY_DATE :String?
    var WARNING : String?
    var PRICE : Int?
    var REQUEST : Int?
    
    var ACTIVITY_CNT : Int?
    var REVIEW_CNT : Int?
    
    var AGE : Int?
    //경력
    var CARRER : Int?
    var DISTANCE : Int?
    
    @IBOutlet weak var scrollView: UIScrollView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 500)

        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        //탭바 숨기기
        self.tabBarController?.tabBar.isHidden = true
        
        
        
        
        cleaner_name.text = gsno(CLEANER_NAME)
        person_rating.rating = gino(PERSON_RATING)
        person_num.text =  "\(gino(PERSON_RATING))/3명"
        
        review_cnt.text = "\(gino(REVIEW_CNT))명"
        
        star_rating.rating = gino(STAR_RATING)
        
        start_time.text = gsno(START_TIME)
        end_time.text = gsno(END_TIME)
        
        appy_date.text = gsno(APPY_DATE)
        warning.text = gsno(WARNING)
        price.text = "\(gino(PRICE))원"
        
        //        request.text = gino(REQUEST)
        
        
//        switch gino(REQUEST) {
//        case 0:
//            request.text = "없음"
//            break
//        case 1:
//            request.text = "에어컨 필터 청소"
//            break
//        case 2:
//            request.text = "창틀 청소"
//            break
//        case 3:
//            request.text = "냉장고 정리"
//            break
//            
//        default:
//            break
//        }
        
        //활동건수
        activity_cnt.text = "활동 : \(gino(ACTIVITY_CNT))건"
        
        //경력
        career.text = "경력 : \(gino(CARRER))개월"
        
        //리뷰
        review_cnt2.text = "리뷰 : \(gino(REVIEW_CNT))회"
        
        //나이
        age.text = "나이 : \(gino(AGE))살"
        
        //이미지
        if let url = URL(string: gsno(IMAGEVIEW)){
            imageView.kf.setImage(with: url)
            imageView.contentMode = .scaleToFill
        }
        
        
        
        
        
        
        
    }
    
    
    
    
}
    
extension ApplyRegionViewController{
    
}
    

