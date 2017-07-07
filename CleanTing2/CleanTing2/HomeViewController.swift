//
//  ViewController.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 27..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit
import Toaster
import Kingfisher

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
    
    
    //내 신청
    var tingregistervo = [TingRegisterVO]()
    
    
    //내 지역
    var tingregionvo = [TingRegionVO]()
    
    
//    let userId = UserDefaults.standard.string(forKey: "userId")
//
//    let lat = UserDefaults.standard.string(forKey: "lat")
//    let lng = UserDefaults.standard.string(forKey: "lng")
//    
    //모델 역할
    //    let players = ["1","2","3","2","5"] //players added till now
    //    let players = ["1","2"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
 
       

        
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //네비게이션 바 컬러
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        //네비게이션 - 텍스트 컬러
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.init(hex: 0xF2D457)]
        navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : Any]
        
        
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 700)
        
        
        
        //colletionview xib 연결
        self.collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        //colletionview xib 연결
        self.collectionView.register(UINib(nibName: "CreateTingCell", bundle: nil), forCellWithReuseIdentifier: "Tingcell")
        
        
        
        
        //tablview xib
        self.tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        //탭바 숨기지 않음
        self.tabBarController?.tabBar.isHidden = false
        
    
    

        executeDelay()
        
       
        
        //        위도 : 37.5218849
        //        경도: 126.8513412
        
        //        //홈이 빠리 넘어와서 데이터가 못따라 잡음
        //        let token = UserDefaults.standard.string(forKey: "token")
        //        print("토우큰 : \(gsno(token))")
    }
    
    
    
}







//컬렉션 뷰
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    
    //섹션당 셀 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tingregistervo.count + 1
        
    }
    
    
    func create(_ sender: UIButton) {
        
        let nvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExpandableViewController") as! ExpandableViewController
        
        //네비게이션 뒤로 버튼 색
        nvc.navigationController?.navigationBar.tintColor = UIColor.init(hex: 0xF2D457)
        
        //네비게이션 - 텍스트 컬러
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.init(hex: 0xF2D457)]
        nvc.navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : Any]
        
        nvc.navigationController?.navigationBar.barTintColor = UIColor.white
        
        //네비게이션
        self.navigationController?.pushViewController(nvc, animated: true)
        
    }
    
    
    //셀 내용
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //        let tingcell = collectionView.dequeueReusableCell(withReuseIdentifier: "Tingcell", for: indexPath) as! CreateTingCell
        //        //
        //                    return tingcell
        
        
        
        //2개로 하면 만들기 2개
        //1개로 하면 1 + 1
        // 0개로 하면
        
        
        if((indexPath.row + 1) <= self.tingregistervo.count ){
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
            
            let tingvo  = tingregistervo[indexPath.row]
            
            //청소부 이름
            cell.CleanerName.text = gsno(tingvo.name)
            
            //날짜
            cell.date.text = gsno(tingvo.date)
            
            //시작시간
            cell.startime.text = gsno(tingvo.startTime)
            
            //끝 시간
            cell.endtime.text = gsno(tingvo.endTime)
            
            
            //요청 수 -> cnt
            cell.personRating.rating = gino(Int(tingvo.cnt!))
            cell.person_num.text = "\(gino(Int(tingvo.cnt!)))/3명"
            
            
            
            if let url = URL(string: gsno(tingvo.image)){
                cell.imageView.kf.setImage(with: url)
                cell.imageView.contentMode = .scaleToFill
            }
            
            
            return cell
        }
            
            
        else{
            
            let tingcell = collectionView.dequeueReusableCell(withReuseIdentifier: "Tingcell", for: indexPath) as! CreateTingCell
            
            tingcell.createTing.addTarget(self, action: #selector(create(_:)), for: .touchUpInside)
            
            
            
            return tingcell
        }
        
        
    }
    
    
    
    
    
    //    private func collectionView(_ collectionView: UICollectionView, willDisplay cell: HomeCollectionViewCell, forItemAt indexPath: IndexPath) {
    //
    //
    //        self.pageControl.currentPage = self.players.count
    //
    //    }
    
    //셀 사이즈 ,UIScreen.main.bounds.size.width
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 368, height: 150)
    }
    
    
    //셀 선택시
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        print("나의 신청 현황")
        print("선택한 컬렉션 뷰 셀 : \(indexPath.row)")
        
        
        let row = indexPath.row
        
        if((row + 0) < self.tingregistervo.count){
            
            
            
            let nvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ApplyInfoViewController") as! ApplyInfoViewController
            
            
            let tingvo  = tingregistervo[indexPath.row]
            
            //변수 생성하고 받아서 넣는다 .
            //            var CLEANER_NAME : String?
            //            var PERSON_RATING : Int?
            //            var STAR_RATING : Int?
            //
            //            var IMAGEVIEW: String?
            //
            //            var START_TIME : String?
            //            var END_TIME : String?
            //
            //            var APPY_DATE :String?
            //            var WARNING : String?
            //            var PRICE : Int?
            //            var REQUEST : Int?
            
            //클리너 이름
            nvc.CLEANER_NAME = gsno(tingvo.name)
            
            
            
            //참가 요청 수
            nvc.PERSON_RATING = gino(Int(tingvo.cnt!))
           
            //별점
            nvc.STAR_RATING = gino(tingvo.rate)
            
            
            //이미지
            nvc.IMAGEVIEW = gsno(tingvo.image)
            
            
            //시작시간
            nvc.START_TIME = gsno(tingvo.startTime)
            
            //끝 시간
            nvc.END_TIME = gsno(tingvo.endTime)
            
            
            
            //신청날짜
            nvc.APPY_DATE = gsno(tingvo.date)
            
            //주의사항
            nvc.WARNING = gsno(tingvo.warning)
            
            //가격
            nvc.PRICE = gino(tingvo.price)
            
            //추가요청 1- 에어컨 필터청소 , 2 - 창틀청소 , 3 - 냉장고 정리
            nvc.REQUEST = gino(tingvo.request)
            
            //활동건수
            nvc.ACTIVITY_CNT = gino(tingvo.activity_cnt)
            
            //리뷰
            nvc.REVIEW_CNT = gino(tingvo.review_cnt)
            
            //나이
            nvc.AGE = gino(tingvo.age)
            
            //경력
            nvc.CARRER = gino(tingvo.career)
            
            
            
            
            
            /************************************************************/
            
            //네비게이션
            self.navigationController?.pushViewController(nvc, animated: true)
            nvc.navigationItem.title = "나의 신청 현황"
            
            
            //네비게이션 뒤로 버튼 색
            nvc.navigationController?.navigationBar.tintColor = UIColor.init(hex: 0xF2D457)
            
            //네비게이션 - 텍스트 컬러
            let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.init(hex: 0xF2D457)]
            nvc.navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : Any]
            
            nvc.navigationController?.navigationBar.barTintColor = UIColor.white
            
            //백 버튼
            let backItem = UIBarButtonItem()
            backItem.title = "back"
            nvc.navigationItem.backBarButtonItem = backItem
            
            
        }else{
            print("맨 마지작 셀은 작동 아됨")
        }
        
        
    }
    
    
    
}




//tableview
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tingregionvo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        
        
        let tingvo  = tingregionvo[indexPath.row]
        
        
        
        //날짜
        cell.date.text = gsno(tingvo.date)
        
        //시작시간
        cell.start_time.text = gsno(tingvo.startTime)
        
        //끝 시간
        cell.end_time.text = gsno(tingvo.endTime)
        
        
        //요청 수 -> cnt
        cell.person_num.rating = gino(Int(tingvo.cnt!))

        
        
        if let url = URL(string: gsno(tingvo.image)){
            cell.imageview.kf.setImage(with: url)
            cell.imageview.contentMode = .scaleToFill
        }
        
        
        
        return cell
    }
    
    
    //tableviewcell heigth
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    
    //상세페이지로 넘어가는 부분
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("내 지역 모집 현황")
        
        let nvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ApplyRegionViewController") as! ApplyRegionViewController
        
        //지역 모델
        let tingvo  = tingregionvo[indexPath.row]
        
        
        
        //클리너 이름
        nvc.CLEANER_NAME = gsno(tingvo.name)
        
        
        
        //참가 요청 수
        nvc.PERSON_RATING = gino(Int(tingvo.cnt!))

        
        //별점
        nvc.STAR_RATING = gino(tingvo.rate)
        
        
        //이미지
        nvc.IMAGEVIEW = gsno(tingvo.image)
        
        
        //시작시간
        nvc.START_TIME = gsno(tingvo.startTime)
        
        //끝 시간
        nvc.END_TIME = gsno(tingvo.endTime)
        
        
        
        //신청날짜
        nvc.APPY_DATE = gsno(tingvo.date)
        
        //주의사항
        nvc.WARNING = gsno(tingvo.warning)
        
        //가격
        nvc.PRICE = gino(tingvo.price)
        
        //추가요청 1- 에어컨 필터청소 , 2 - 창틀청소 , 3 - 냉장고 정리
        nvc.REQUEST = gino(tingvo.request)
        
        //활동건수
        nvc.ACTIVITY_CNT = gino(tingvo.activity_cnt)
        
        //리뷰
        nvc.REVIEW_CNT = gino(tingvo.review_cnt)
        
        //나이
        nvc.AGE = gino(tingvo.age)
        
        //경력
        nvc.CARRER = gino(tingvo.career)
        
        //거리
        nvc.DISTANCE = gino(tingvo.distance)
        
        
        
        
        
        
        
        
        
        //네비게이션
        self.navigationController?.pushViewController(nvc, animated: true)
        nvc.navigationItem.title = "내 지역 모집 현황"
        //네비게이션 뒤로 버튼 색
        nvc.navigationController?.navigationBar.tintColor = UIColor.init(hex: 0xF2D457)
        
        //네비게이션 - 텍스트 컬러
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.init(hex: 0xF2D457)]
        nvc.navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : Any]
        
        nvc.navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
}

extension HomeViewController : NetworkCallback{
    
    //    if code == "board"{
    //    boardList = resultData as! [BoardVO]
    //    //            print("게시판 JSON : \(boardList)")
    //    tableView.reloadData()
    //    }
    
    func networkResult(resultData: Any, code: String) {
        
        //내 신청현황
        if code == "tingReigster"{
            
            tingregistervo = resultData as! [TingRegisterVO]
            collectionView.reloadData()
            
        }
        
        if code == "tingReigsterError"{
            Toast(text:"데이터를 읽어 올수 없습니다.").show()
            ToastView.appearance().backgroundColor = UIColor.init(hex: 0xF2D457)
            ToastView.appearance().textColor = UIColor.black
            
        }
        
        
        //내 지역 현황
        if code == "tingRegionSuccess"{
            
            tingregionvo = resultData as! [TingRegionVO]
            tableView.reloadData()
            
        }
        if code == "serverError"{
            Toast(text:"서버 에러").show()
            ToastView.appearance().backgroundColor = UIColor.init(hex: 0xF2D457)
            ToastView.appearance().textColor = UIColor.black
            
        }
        if code == "headerError"{
            Toast(text:"헤더 값 에러.").show()
            ToastView.appearance().backgroundColor = UIColor.init(hex: 0xF2D457)
            ToastView.appearance().textColor = UIColor.black
            
        }
        if code == "tokenError"{
            Toast(text:"토큰 에러").show()
            ToastView.appearance().backgroundColor = UIColor.init(hex: 0xF2D457)
            ToastView.appearance().textColor = UIColor.black
            
        }
        
        
    }
}



extension HomeViewController {
    
    
    func executeDelay() {
        
        let when = DispatchTime.now() + 0.5// change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
//            //유저아이디 저장
//            UserDefaults.standard.set(gsno(userId), forKey: "userId")
//            UserDefaults.standard.set(gsno(address), forKey: "address")
//            
//            //위도 경도
//            UserDefaults.standard.set(gdno(lat), forKey: "lat")
//            UserDefaults.standard.set(gdno(lng), forKey: "lng")
//            
//            //지역번호
//            UserDefaults.standard.set(gino(locationNum), forKey: "locationNum")
       
            
            let userId = UserDefaults.standard.string(forKey: "userId")
            print("홈 유저아이디 : \(userId!)")
            
            let address = UserDefaults.standard.string(forKey: "address")
            print("홈 주소 : \(address!)")
            
            let lat_ = UserDefaults.standard.string(forKey: "lat")
            print("홈 위도 : \(lat_!)")
            let lat = Double(lat_!)
            
            let lng_ = UserDefaults.standard.string(forKey: "lng")
            print("홈 경도 : \(lng_!)")
            let lng = Double(lng_!)

            
            let locationNum = UserDefaults.standard.string(forKey: "locationNum")
            print("홈 로컬넘버 : \(locationNum!)")
            
            
            
            let model = TingRegisterModel(self)
           model.getTingRegisterList(userId: self.gsno(userId))
            
            let model2 = TingRegionModel(self)
            model2.getTingRegionList(userId : self.gsno(userId) ,userLat: self.gdno(lat), userLng: self.gdno(lng) )

    }
 }
    
}
