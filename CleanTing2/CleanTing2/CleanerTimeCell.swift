//
//  CleanerTimeCell.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 2..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit

//프로토콜 내 함수는 같아도 프로토콜 명이 달라야 함.
protocol passDataDelegate: class {
    
    func dataString_pass(params : String, params2: String)
    
}

//청소시간 선택하기 
class CleanerTimeCell: UITableViewCell{

    
    open var delegate : passDataDelegate?

    
    
    @IBOutlet weak var btn800 : UIButton!
    @IBOutlet weak var btn830 : UIButton!
    @IBOutlet weak var btn900 : UIButton!
    @IBOutlet weak var btn930 : UIButton!
    @IBOutlet weak var btn1000 : UIButton!
    @IBOutlet weak var btn1030 : UIButton!
    @IBOutlet weak var btn1100 : UIButton!
    @IBOutlet weak var btn1130 : UIButton!
    @IBOutlet weak var btn1200 : UIButton!
    @IBOutlet weak var btn1230 : UIButton!
    @IBOutlet weak var btn1300 : UIButton!
    @IBOutlet weak var btn1330 : UIButton!

    
    
    
    
    @IBAction func timeBtnAction(_ sender: UIButton) {
        
        let time_ = sender.currentTitle
        
        let time = String(time_!)
        
        var end_time : String = ""
        
        
        print ("시작 시간 설정 : \(time!)")
        print ("끝 시간 설정 : \(end_time)")

        
        
        
        
        
        
        
        
        
        
        if (time! == "8 : 00"){
            end_time = "16 : 00"
            delegate?.dataString_pass(params: time!, params2: end_time)
            
            btn800.setTitleColor(UIColor.init(hex: 0xF2D457), for: UIControlState())
            btn830.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn900.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn930.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1000.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1030.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1100.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1130.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1200.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1230.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1300.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1330.setTitleColor(UIColor.darkGray, for: UIControlState())


            print ("끝 시간 설정 : \(end_time)")

        }
        
        else if (time! == "8 : 30"){
            end_time = "16 : 30"
            delegate?.dataString_pass(params: time!, params2: end_time)
            print ("끝 시간 설정 : \(end_time)")
            
            btn800.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn830.setTitleColor(UIColor.init(hex: 0xF2D457), for: UIControlState())
            btn900.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn930.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1000.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1030.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1100.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1130.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1200.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1230.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1300.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1330.setTitleColor(UIColor.darkGray, for: UIControlState())

        }
        
        else if (time! == "9 : 00"){
            end_time = "17 : 00"
            delegate?.dataString_pass(params: time!, params2: end_time)
            print ("끝 시간 설정 : \(end_time)")
            btn800.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn830.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn900.setTitleColor(UIColor.init(hex: 0xF2D457), for: UIControlState())
            btn930.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1000.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1030.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1100.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1130.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1200.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1230.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1300.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1330.setTitleColor(UIColor.darkGray, for: UIControlState())
        }
        
        else if (time! == "9 : 30"){
            end_time = "17 : 30"
            delegate?.dataString_pass(params: time!, params2: end_time)
            print ("끝 시간 설정 : \(end_time)")
            btn800.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn830.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn900.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn930.setTitleColor(UIColor.init(hex: 0xF2D457), for: UIControlState())
            btn1000.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1030.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1100.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1130.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1200.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1230.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1300.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1330.setTitleColor(UIColor.darkGray, for: UIControlState())

        }
        
        else if (time! == "10 : 00"){
            end_time = "18 : 00"
            delegate?.dataString_pass(params: time!, params2: end_time)
            print ("끝 시간 설정 : \(end_time)")
            btn800.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn830.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn900.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn930.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1000.setTitleColor(UIColor.init(hex: 0xF2D457), for: UIControlState())
            btn1030.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1100.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1130.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1200.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1230.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1300.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1330.setTitleColor(UIColor.darkGray, for: UIControlState())

        }
        
        else if (time! == "10 : 30"){
            end_time = "18 : 00"
            delegate?.dataString_pass(params: time!, params2: end_time)
            print ("끝 시간 설정 : \(end_time)")

            btn800.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn830.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn900.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn930.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1000.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1030.setTitleColor(UIColor.init(hex: 0xF2D457), for: UIControlState())
            btn1100.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1130.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1200.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1230.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1300.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1330.setTitleColor(UIColor.darkGray, for: UIControlState())
        }
        
        else if (time! == "11 : 00"){
            end_time = "19 : 00"
            delegate?.dataString_pass(params: time!, params2: end_time)
            print ("끝 시간 설정 : \(end_time)")

            btn800.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn830.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn900.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn930.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1000.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1030.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1100.setTitleColor(UIColor.init(hex: 0xF2D457), for: UIControlState())
            btn1130.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1200.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1230.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1300.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1330.setTitleColor(UIColor.darkGray, for: UIControlState())
        }
        else if (time! == "11 : 30"){
            end_time = "19 : 30"
            delegate?.dataString_pass(params: time!, params2: end_time)
            print ("끝 시간 설정 : \(end_time)")
            
            btn800.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn830.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn900.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn930.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1000.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1030.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1100.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1130.setTitleColor(UIColor.init(hex: 0xF2D457), for: UIControlState())
            btn1200.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1230.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1300.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1330.setTitleColor(UIColor.darkGray, for: UIControlState())

        }
        else if (time! == "12 : 00"){
            end_time = "20 : 00"
            delegate?.dataString_pass(params: time!, params2: end_time)
            print ("끝 시간 설정 : \(end_time)")
            
            btn800.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn830.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn900.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn930.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1000.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1030.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1100.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1130.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1200.setTitleColor(UIColor.init(hex: 0xF2D457), for: UIControlState())
            btn1230.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1300.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1330.setTitleColor(UIColor.darkGray, for: UIControlState())

        }
        else if (time! == "12 : 30"){
            end_time = "20 : 30"
            delegate?.dataString_pass(params: time!, params2: end_time)
            print ("끝 시간 설정 : \(end_time)")
            
            btn800.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn830.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn900.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn930.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1000.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1030.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1100.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1130.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1200.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1230.setTitleColor(UIColor.init(hex: 0xF2D457), for: UIControlState())
            btn1300.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1330.setTitleColor(UIColor.darkGray, for: UIControlState())

        }
        else if (time! == "13 : 00"){
            end_time = "21 : 00"
            delegate?.dataString_pass(params: time!, params2: end_time)
            print ("끝 시간 설정 : \(end_time)")
            
            btn800.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn830.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn900.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn930.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1000.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1030.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1100.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1130.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1200.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1230.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1300.setTitleColor(UIColor.init(hex: 0xF2D457), for: UIControlState())
            btn1330.setTitleColor(UIColor.darkGray, for: UIControlState())

        }
        else if (time! == "13 : 30"){
            end_time = "21 : 30"
            delegate?.dataString_pass(params: time!, params2: end_time)
            print ("끝 시간 설정 : \(end_time)")
            
            btn800.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn830.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn900.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn930.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1000.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1030.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1100.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1130.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1200.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1230.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1300.setTitleColor(UIColor.darkGray, for: UIControlState())
            btn1330.setTitleColor(UIColor.init(hex: 0xF2D457), for: UIControlState())

        }






        
    }

    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    
}
