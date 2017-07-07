//
//  WarningCell.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 1..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit


class WarningCell : UITableViewCell{
    
    @IBOutlet weak var tf: UITextField!
    
    @IBAction func send_text(_ sender: UITextField){
        let data = tf.text!
        print("주의사항 내용 : \(data)")
        UserDefaults.standard.set(data, forKey: "warning")

    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.w_textView?.delegate = self
        
    }
   
    
    
    
    
}

//extension WarningCell : UITextViewDelegate{
//
//    
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if (w_textView?.text == "test"){
//            w_textView?.text = ""
//        }
//    }
//    
//    
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if (w_textView?.text == ""){
//            w_textView?.text = "test"
//        }
//    }
//}

