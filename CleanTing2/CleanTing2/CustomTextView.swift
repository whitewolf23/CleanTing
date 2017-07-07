//
//  PlaceholerTextView.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 1..
//  Copyright © 2017년 김민수. All rights reserved.
//


import UIKit


class CustomTextView: UITextView {
    //border custom
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.text == "test"){
            textView.text = ""
        }
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text == ""){
            textView.text = "test"
        }
    }
}
