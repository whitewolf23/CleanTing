//
//  AddRequestCell.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 2..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit


protocol pass_DataDelegate: class {
    
    func datapass(params : Int)
    
}

class AddRequestCell: UITableViewCell{
    
    var display : Int = 0
    
    open var delegate : pass_DataDelegate?

    
    @IBOutlet weak var button1: CustomButton!
    
    @IBOutlet weak var button2: CustomButton!
    @IBOutlet weak var button3: CustomButton!
    let image1 : UIImage = UIImage(named : "aircon_yelllloww")!
    let image2 : UIImage = UIImage(named : "changtteeeuulllyellow")!
    let image3 : UIImage = UIImage(named : "nengjangggppppyellow")!
    
    
    let image_1 : UIImage = UIImage(named : "123")!
    let image_2 : UIImage = UIImage(named : "456")!
    let image_3 : UIImage = UIImage(named : "789")!
    
    
    @IBAction func addRequestAction(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        display = Int(digit)!
        delegate?.datapass(params: display)
        
        print("\(digit) 클릭 됨 " )
        print(" 전달할 값 : \(display)")
        
        
        if (sender.tag == 1){
            button1.setBackgroundImage(image1, for: UIControlState())
            button2.setBackgroundImage(image_2, for: UIControlState())
            button3.setBackgroundImage(image_3, for: UIControlState())
            
        }else if (sender.tag == 2){
            button1.setBackgroundImage(image_1, for: UIControlState())
            button2.setBackgroundImage(image2, for: UIControlState())
            button3.setBackgroundImage(image_3, for: UIControlState())
            
        }else if (sender.tag == 3){
            button1.setBackgroundImage(image_1, for: UIControlState())
            button2.setBackgroundImage(image_2, for: UIControlState())
            button3.setBackgroundImage(image3, for: UIControlState())
        }
        
        
    }
    
//    var displayValue : Int{
//        //가져오기
//        //diplayValue값을 가져오기 위한 코드
//        get{
//            return display!
//        }
//        
//        //설정하기
//        //누군가 변수를 설정할때 실행되는 코드
//        set{
//            display = newValue
//            print(display)
//        }
//    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
        button1.imageView?.contentMode = .scaleAspectFit
        button2.imageView?.contentMode = .scaleAspectFit
        button3.imageView?.contentMode = .scaleAspectFit

    }
    
}
