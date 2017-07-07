//
//  ExpandableViewController.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 29..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit

//프로토콜 이용해서 cell -> viewcontroller 에 datapass해야함 
//캘린더 뷰도 해당 버튼 누르고 달력 설정 or viewcontroller   와 cell 연동 



class ExpandableViewController: UIViewController{
    

    
    @IBAction func Create_Ting_Action(_ sender: Any) {
        
        let model = TingGenrateModel(self)
        model.generate_Ting(userId: gsno(userId), date: gsno(r_calendar_data), startTime: gsno(r_params_string), endTime: gsno(r_params_string_end), price: "13000", cleanerId: "jiwon", request: gino(r_params), warning: gsno(r_warning), lat: gdno(Double(lat!)), lng: gdno(Double(lng!)))
        
        
        
        print("팅 생성 버튼 눌림")
        
        
    }
    
    
    
    //추가요청 셀에 잇는 파라미터 값을 받기 위한 변수
    //request
    var r_params : Int = 0
    
    //시작 시간
    var r_params_string : String = ""
  
    //끝시간
    var r_params_string_end : String = ""
    
    //날짜
    var r_calendar_data : String = "날짜 선택"
    
    //주의사항 데이터
    var r_warning : String = ""
    
    //팅 생성 리스트 
    var tinglist = [TingGenerateListVO]()

    
    @IBOutlet weak var tableView: UITableView!
    
    
    //유저아이디
    let userId = UserDefaults.standard.string(forKey: "userId")

    
    //주소
    let address = UserDefaults.standard.string(forKey: "address")
    
    
    
    let lat = UserDefaults.standard.string(forKey: "lat")
    let lng = UserDefaults.standard.string(forKey: "lng")


    let warning = UserDefaults.standard.string(forKey: "warning")

    
    //false 접기, true 펴기
    lazy var sections : [Expendable_Section] = {
        let section1 = Expendable_Section(title : "청소지역", data: "0", expendable: true)
        let section2 = Expendable_Section(title: "청소시간",  data: "0" , expendable: true)
        let section3 = Expendable_Section(title: "청소날짜", data: "0" , expendable: true)
        let section4 = Expendable_Section(title: "추가요청",  data: "0" , expendable: true)
        let section5 = Expendable_Section(title: "주의사항",  data: "0", expendable: true)
        let section6 = Expendable_Section(title: "클린너 선택",  data: "0" , expendable: false)
        
        let section7 = Expendable_Section(title: "총금액", data: "0" , expendable: true)
        
        return [section1, section2,section3, section4, section5, section6, section7]
        
    }()
    
    
    let image1 : UIImage = UIImage(named : "aircon_yelllloww")!
    let image2 : UIImage = UIImage(named : "changtteeeuulllyellow")!
    let image3 : UIImage = UIImage(named : "nengjangggppppyellow")!
   
    
    let image_1 : UIImage = UIImage(named : "123")!
    let image_2 : UIImage = UIImage(named : "456")!
    let image_3 : UIImage = UIImage(named : "789")!
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UserDefaults.standard.removeObject(forKey: "warning")
        UserDefaults.standard.synchronize()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
      
        
        
        executeDelay()
        
        
        print("팅만들기 주소 : \(address!)")

        
        //청소지역
        self.tableView.register(UINib(nibName: "CleanerRegionCell", bundle: nil), forCellReuseIdentifier: "r_cell")
        
        //청소날짜
        self.tableView.register(UINib(nibName: "CleanerCalendarCell", bundle: nil), forCellReuseIdentifier: "cal_cell")
        
        //청소시간
        self.tableView.register(UINib(nibName: "CleanerTimeCell", bundle: nil), forCellReuseIdentifier: "t_cell")
        
        //추가요청
        self.tableView.register(UINib(nibName: "AddRequestCell", bundle: nil), forCellReuseIdentifier: "a_cell")
        
        
        //클리너 추가
        self.tableView.register(UINib(nibName: "ChooseCleanerCell", bundle: nil), forCellReuseIdentifier: "c_cell")
        
        //주의사항
        self.tableView.register(UINib(nibName: "WarningCell", bundle: nil), forCellReuseIdentifier: "warning_cell")
        
        //총금액
        self.tableView.register(UINib(nibName: "TotalPriceCell", bundle: nil), forCellReuseIdentifier: "totalCell")
        
    }
    
override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        

        //달력데이터 늦게 받기
    
}
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        

    }


    
}





extension ExpandableViewController : UITableViewDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate {
    
    
    
    
    
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expendable = !sections[section].expendable
        tableView.beginUpdates()
        
        
        for i in 0 ..< sections[section].data.count{
            tableView.reloadRows(at: [IndexPath(row : i, section: section)], with: .automatic)
            
        }
        tableView.endUpdates()
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
        
    }
    
    //섹션당 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].data.count
    }
    
    //헤더 높이
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     
        //오픈시 높이 44 , 닫을때 높이 0
        if(sections[indexPath.section].expendable){
            //클리너 선택
            if (indexPath.section == 5 && indexPath.item == 0){
                return 300
                //주의사항
            }else if(indexPath.section == 4 && indexPath.item == 0) {
                return 350
                //총금액
            }else if (indexPath.section == 6 && indexPath.item == 0){
                return 100
            }else if(indexPath.section == 0 && indexPath.item == 0){
                return 100

                //청소날짜
            }else if(indexPath.section == 2 && indexPath.item == 0){
                return 44
                //청소시간 
            }else if(indexPath.section == 1 && indexPath.item == 0){
                return 500
            }else if(indexPath.section == 3 && indexPath.item == 0){
                return 390
            }
            
            
            
            
            return 44
        }else{
            return 0
        }
        
        
//        if (indexPath.section == 4 && indexPath.item == 0){
//            return 300
//        }else{
//            return 0
//        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        
        header.customInit(title: sections[section].title, section: section, delegate: self as ExpandableHeaderViewDelegate)
        
        
        return header
    }
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        _ = sections[indexPath.section].data[indexPath.row]
    
        
        //주소
        if indexPath.section == 0 && indexPath.item == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "r_cell", for: indexPath) as! CleanerRegionCell
            
            cell.c_address.text = gsno(address)
            cell.selectionStyle = .none
            return cell
            
        }
        
        //청소시간
        if indexPath.section == 1 && indexPath.item == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "t_cell", for: indexPath) as! CleanerTimeCell
            
            
            cell.selectionStyle = .none
            
            //passdatadelegate
            //청소시간 보내기
            cell.delegate = self

            
//            cell.btn800.addTarget(self, action: #selector(select_time(_:)), for: .touchUpInside)
//            
//            cell.btn830.addTarget(self, action: #selector(select_time(_:)), for: .touchUpInside)
            
            return cell
            
        }
        
        //청소날짜
        if indexPath.section == 2 && indexPath.item == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cal_cell", for: indexPath) as! CleanerCalendarCell
            
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
           
            cell.calendar_label.text = self.r_calendar_data

            return cell
            
        }
        
        //추가요청
        if indexPath.section == 3 && indexPath.item == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "a_cell", for: indexPath) as! AddRequestCell
            cell.selectionStyle = .none
           
            //add request 값 받오기위 한 연결고리
            //꼭 필요한 부분
            //pass_DataDelegate
            cell.delegate = self
            
            
            //에어컨 청소 선택 시
            cell.button1.addTarget(self, action: #selector(changeBorder(_:)), for: .touchUpInside)
            cell.button2.addTarget(self, action: #selector(changeBorder(_:)), for: .touchUpInside)
            cell.button3.addTarget(self, action: #selector(changeBorder(_:)), for: .touchUpInside)
            
            return cell
            
        }

        
        //주의사항
        if indexPath.section == 4 && indexPath.item == 0{
            
            let warning_cell = tableView.dequeueReusableCell(withIdentifier: "warning_cell", for:indexPath) as! WarningCell
            warning_cell.selectionStyle = .none
            
            
           
            return warning_cell
            
            
            
        }
        
       
            
        //클리너 선택
   
        if indexPath.section == 5 && indexPath.item == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "c_cell", for:indexPath) as! ChooseCleanerCell
            cell.selectionStyle = .none
            
            //뷰 이동 버튼
            cell.choose_cleaner.addTarget(self, action: #selector(move_choose_view(_:)), for: .touchUpInside)
            return cell

            
        }
        
        
        //총금액
        if indexPath.section == 6 && indexPath.item == 0{
            
            let totalCell = tableView.dequeueReusableCell(withIdentifier: "totalCell", for:indexPath) as! TotalPriceCell
            totalCell.selectionStyle = .none
            
            return totalCell
            
            
            
        }
            
        else{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
//            cell1.textLabel?.text = row
//            
            if indexPath.section == 2 && indexPath.item == 0 {
                cell1.accessoryType = .disclosureIndicator
            }
//                else if indexPath.section == 0 && indexPath.item == 1{
//                cell1.accessoryType = .disclosureIndicator
//            }
//            else {
//                cell1.accessoryType = .none
//            }
            
//            cell1.selectionStyle = .none
            return cell1
            
        }

        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        if indexPath.section == 2 && indexPath.item == 0 {
            
            
            
            let nvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController
            
            
            //네비게이션
            self.navigationController?.pushViewController(nvc, animated: true)
            
        }
    }
    
    
  
    
}




extension ExpandableViewController: pass_DataDelegate, passDataDelegate{
  
//    func dataStringpass(params: String) {
//        self.r_params_string = params
//        print(" 받아온 시작 시간: \(r_params_string)")
//
//    }

   
    func dataString_pass(params: String, params2: String) {
        self.r_params_string = params
        self.r_params_string_end = params2
        print(" 받아온 시작 시간: \(r_params_string)")
        print(" 받아온 끝 시간: \(r_params_string_end)")

    }

    
    
    internal func datapass(params : Int) {
        self.r_params = params
        print(" 받아온 요청 번호: \(r_params)")
    }


    
//    
//    internal func dataCalendarpass(params : String) {
//        self.r_calendar_data = params
//        print(" 받아온 캘린더 데이터: \(r_calendar_data)")
//    }
    

    //loginview에서 값을 가져오는 부분
//    internal func Datapass(email: String, pw:String){
//        self.emailStored = email
//        self.passwordStored = pw
//        print("입력된 비밀번호 : \(pw)")
//    }
    
    
    
    //셀에서는 함수 작동이 안된서 viewcontroller 에서 가져와서 해야함
    func changeBorder( _ sender : UIButton){
      
        print("추가사항 버튼  작동")
        sender.imageView?.contentMode = .scaleAspectFit

   
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            
            //1 -선택
            if (sender.tag == 1){
                sender.setBackgroundImage(self.image1, for: UIControlState())
                datapass(params: r_params)
                print("선택 됨")

            }else if (sender.tag == 2){
                sender.setBackgroundImage(self.image2, for: UIControlState())
                datapass(params: r_params)
                print("선택 됨")
                
            }else if (sender.tag == 3){
                sender.setBackgroundImage(self.image3, for: UIControlState())
                datapass(params: r_params)
                print("선택 됨")
            }
            
            
        } else {
            //비선택
            if (sender.tag == 1){
                sender.setBackgroundImage(self.image_1, for: UIControlState())
                datapass(params: 0)
                print("에어컨 선택 안됨")
                
               }
            
            if(sender.tag == 2){
                sender.setBackgroundImage(self.image_2, for: UIControlState())
                datapass(params: 0)
                print("창틀 선택 안됨")
                
            }
            
            if(sender.tag == 3){
                sender.setBackgroundImage(self.image_3, for: UIControlState())
                datapass(params: 0)
                print("냉장고 선택 안됨")
                
            }
                
                
            
                
                
                
                
                
            }
        }
        
    }
//    @IBAction func select_seoul(_ sender: Any) {
//        for region_row in region_stackView.subviews{
//            for region in region_row.subviews{
//                region.backgroundColor = UIColor.white
//                seoul.backgroundColor = UIColor.init(hex: "F3CE44", alpha: 1.0)
//            }
//        }
//        region = "서울"
//        
//    }
    
    


extension ExpandableViewController: NetworkCallback{
    
    func networkResult(resultData: Any, code: String) {
        if code == "팅 생성 성공"{
            
            tinglist = resultData as! [TingGenerateListVO]
            tableView.reloadData()

        }
        tableView.reloadData()

    }
    
    
    //시간선택
    func move_choose_view( _ sender : UIButton){
        
        print("함수 작동")
       
        
        let nvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController2") as! SearchViewController2
        
        
        //네비게이션
        self.navigationController?.pushViewController(nvc, animated: true)
        
        //청소시간 받기
//        dataStringpass(params: gsno(r_params_string))
        
        
    }
    
    func executeDelay() {
        
        let when = DispatchTime.now() + 0.3// change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
       
            
            if UserDefaults.standard.object(forKey: "calendar_data") != nil {
                let calendar_data = UserDefaults.standard.string(forKey: "calendar_data")
                self.r_calendar_data = calendar_data!

                print("받아온 날짜 데이터 : \(self.r_calendar_data)")
            }else{
                print("받아온 날짜 없음")
            }//
            
            
            if UserDefaults.standard.object(forKey: "warning") != nil {
                let warning = UserDefaults.standard.string(forKey: "warning")
                self.r_warning = warning!
                
                print("받아온 주의사항 데이터 : \(self.r_warning)")
            }else{
                print("받아온 주의사항 없음")
            
            }//
            
        }
    }
}
