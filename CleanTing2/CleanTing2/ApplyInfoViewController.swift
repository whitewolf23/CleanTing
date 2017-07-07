//
//  ApplyInfoViewController.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 28..
//  Copyright © 2017년 김민수. All rights reserved.
//



//
//"cleanerId": "jiwon",
//"tingId": 59,
//"date": "2017-07-05",
//"startTime": "13:00",
//"endTime": "16:00",
//"cnt": "2",
//"userId": "bumma",
//"price": 30000,
//"request": 0, -> 1,에어컨 필터  2,창틀청소  3, 냉장고 정리
//"warning": "",
//"name": "김지원",
//"phone": "010-3333-3333",
//"age": 26,
//"career": 3,
//"area": "노원구 중계동",
//"rate": 5,
//"review_cnt": 1,
//"activity_cnt": null,
//"image": "https://hatemush.s3.ap-northeast-2.amazonaws.com/1499095410202.png"
//



import UIKit

class ApplyInfoViewController : UIViewController{
    
    @IBAction func call_action(_ sender: Any) {
        print("전화 걸기")
        
        
    }
    
    @IBAction func move_DetailCleaner(_ sender: Any) {
        print(" 내클리너 상세보기 로 이동")
        
        
    }
    //나의 신청현황 수정 뷰로 넘어가기 
    @IBAction func edit_action(_ sender: Any) {
   
    
        let nvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditApplyViewController") as! EditApplyViewController
        
        
        
        
        //네비게이션
        self.navigationController?.pushViewController(nvc, animated: true)
    
    }
    
    @IBOutlet weak var cleaner_name : UILabel!
    @IBOutlet weak var person_rating : PersonRatingControl!
    @IBOutlet weak var star_rating : StarRatingControl!
    
    @IBOutlet weak var imageView : UIImageView!
    
    @IBOutlet weak var start_time : UILabel!
    @IBOutlet weak var end_time : UILabel!
    
    @IBOutlet weak var appy_date : UILabel!
    @IBOutlet weak var warning : UILabel!
    @IBOutlet weak var price : UILabel!
    @IBOutlet weak var request : UILabel!
    
    @IBOutlet weak var person_num : UILabel!     // 1/3명
    
    //경력
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "나의 신청 현황"
        
        print("넘어 온 값 :  \(gsno(CLEANER_NAME))")
        
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
        
        
        switch gino(REQUEST) {
        case 0:
            request.text = "없음"
            break
        case 1:
            request.text = "에어컨 필터 청소"
            break
        case 2:
            request.text = "창틀 청소"
            break
        case 3:
            request.text = "냉장고 정리"
            break
            
            
            
            
        default:
            break
        }
        
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
        
        
        
        
        
        //네비게인션 푸시하는 부분에서 색 변경해주면 여기서 그대로 적요
        //백버튼은 도착 지점에서 바꿔줘야한다.
        //       navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(preview))
        //
        let backButtonImage: UIImage = UIImage(named: "back")!
        var _: UIBarButtonItem = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action:#selector(preview))
        
        
        
        
    }
    
    func preview(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
}
