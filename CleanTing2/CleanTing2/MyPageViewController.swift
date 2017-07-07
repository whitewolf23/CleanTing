//
//  MyPageViewController.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 27..
//  Copyright © 2017년 김민수. All rights reserved.
//


import UIKit
import Toaster

struct SectionData {
    
    let title: String
    let data : [String]
    
    var numberOfItems:Int{
        return data.count
    }
    
    subscript(index:Int) -> String{
        return data[index]
    }
}

extension SectionData {
    init(title : String, data: String... ){
        self.title = title
        self.data = data
    }
}



class MyPageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var Logout: UIButton!
    
    //값 전달 딜리게이트

    
    lazy var settings : [SectionData] = {
        let section1 = SectionData(title : "0", data: "0문의하기", "1버전정보", "2탈퇴하기", "3계좌관리", "4알림설정", "5오픈소스 라이센스", "6나의 이용내역" )
        let section2 = SectionData(title : "1", data: "0클리너 등록", "1클리너 관리 ", "2 로그아웃")
        
        return [section1, section2]
        
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        //시간차로 인해 비동기 동기 구분 하여 받아야함
        
        let token = UserDefaults.standard.string(forKey: "token")
        print("토우큰 : \(gsno(token))")
        
        let userId = UserDefaults.standard.string(forKey: "userId")
        print("아이뒤 : \(gsno(userId))")
        
        
 
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   

        
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "HeaderCell")
        
        self.tableView.tableFooterView = UIView()
        
        
        //로그아웃 버튼 연결
         self.tableView.register(UINib(nibName: "LogoutCell", bundle: nil), forCellReuseIdentifier: "cell4")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
}

extension MyPageViewController: UITableViewDataSource, UITableViewDelegate {
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return settings.count
    }
    
     func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        
        let header = view as! UITableViewHeaderFooterView
        
        header.textLabel?.textColor = UIColor.red
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderCell")
        
        
        headerView?.backgroundColor = UIColor.clear
        headerView?.textLabel?.tintColor = UIColor.orange
        headerView?.textLabel?.text = settings[section].title
        headerView?.textLabel?.textColor = UIColor.red
        
        return headerView
    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].numberOfItems
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if indexPath.section == 0 && indexPath.item == 6 {
            //버전
          
            let nvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyLogViewController") as! MyLogViewController
            
            
            //네비게이션
            self.navigationController?.pushViewController(nvc, animated: true)
            
            
            //네비게이션 - 텍스트 컬러
            let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.init(hex: 0xF2D457)]
            nvc.navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : Any]
            
            nvc.navigationController?.navigationBar.barTintColor = UIColor.white
            
            
            //네비게이션 레프트 아이템
            nvc.navigationController?.navigationBar.tintColor = UIColor.init(hex: 0xF2D457)
            
            
            //백 버튼
            let backItem = UIBarButtonItem()
            backItem.title = "back"
            nvc.navigationItem.backBarButtonItem = backItem
            
            print("나의 이용 내역")
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellTitle = settings[indexPath.section][indexPath.row]
        //좌표입력
        if indexPath.section == 0 && indexPath.item == 1 {
            //버전

            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            cell2.selectionStyle = .none
            return cell2
            
        } else if indexPath.section == 0 && indexPath.item == 4{
            //알림

            let cell3 = tableView.dequeueReusableCell(withIdentifier: "cell3", for:indexPath)
            cell3.selectionStyle = .none
            return cell3
           
            //로그아웃
        }else if indexPath.section == 1 && indexPath.item == 2{
            
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "cell4", for:indexPath) as! LogoutCell
            
            cell4.selectionStyle = .none
           
            //xib 로그아웃 버튼 연결
            cell4.Logout_btn.addTarget(self, action: #selector(Logout_Action), for: .touchUpInside)
            
//            tingcell.createTing.addTarget(self, action: #selector(create(_:)), for: .touchUpInside)
            
            return cell4
        
        
        
        }else{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            
            cell1.textLabel?.text = cellTitle
           
            //문의하기
            if indexPath.section == 0 && indexPath.item == 0 {
                cell1.accessoryType = .disclosureIndicator
                
                //나의 이용 내역
            } else if indexPath.section == 0 && indexPath.item == 6{
                cell1.accessoryType = .disclosureIndicator
            }
            else {
                cell1.accessoryType = .none
            }
            
            cell1.selectionStyle = .none
            return cell1
            
        }
        
    }
    
    
//    let userId = UserDefaults.standard.string(forKey: "userId")
//    print("홈 유저아이디 : \(userId!)")
//    
//    let address = UserDefaults.standard.string(forKey: "address")
//    print("홈 주소 : \(address!)")
//    
//    let lat = UserDefaults.standard.string(forKey: "lat")
//    print("홈 위도 : \(lat!)")
//    
//    let lng = UserDefaults.standard.string(forKey: "lng")
//    print("홈 경도 : \(lng!)")
//    
//    let locationNum = UserDefaults.standard.string(forKey: "locationNum")
//    print("홈 로컬넘버 : \(locationNum!)")

    //    UserDefaults.standard.set(data, forKey: "calendar_data")

    
    
    func Logout_Action(){
        
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.removeObject(forKey: "userId")
        UserDefaults.standard.removeObject(forKey: "calendar_data")
        UserDefaults.standard.removeObject(forKey: "lat")
        UserDefaults.standard.removeObject(forKey: "lng")
        UserDefaults.standard.removeObject(forKey: "locationNum")
        UserDefaults.standard.removeObject(forKey: "address")
        UserDefaults.standard.removeObject(forKey: "warning")



        UserDefaults.standard.synchronize()

        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
        present(vc, animated: true, completion: nil)
        
        //토스트 메세지
        Toast(text: "로그아웃 되었습니다.").show()
        ToastView.appearance().backgroundColor = UIColor.init(hex: 0xF2D457)
        ToastView.appearance().textColor = UIColor.black
        print("Logout")
    }
    
    
    
}
