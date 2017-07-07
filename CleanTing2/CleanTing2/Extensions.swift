//
//  Extensions.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 27..
//  Copyright © 2017년 김민수. All rights reserved.
//

//#F2D457

import Foundation
import UIKit
import ObjectMapper





extension Mappable{
    //옵셔널 String을 해제하는데 값이 nil이면 ""을 반환
    func gsno(_ data: String?) -> String {
        guard let str = data else {
            return ""
        }
        return str
    }
    
    //옵셔널 Int를 해제하는데 값이 nil이면 0을 반환
    func gino(_ data: Int?) -> Int {
        guard let num = data else {
            return 0
        }
        return num
    }
    
    func gfno(_ data: Float?) -> Float {
        guard let num = data else {
            return 0
        }
        return num
    }
    
    func gdno(_ data: Double?) -> Double {
        guard let num = data else {
            return 0
        }
        return num
    }
    
}

extension UIViewController{
    
    
    //옵셔널 String을 해제하는데 값이 nil이면 ""을 반환
    func gsno(_ data: String?) -> String {
        guard let str = data else {
            return ""
        }
        return str
    }
    
    //옵셔널 Int를 해제하는데 값이 nil이면 0을 반환
    func gino(_ data: Int?) -> Int {
        guard let num = data else {
            return 0
        }
        return num
    }
    
    func gdno(_ data: Double?) -> Double {
        guard let num = data else {
            return 0
        }
        return num
    }
    
    func simpleAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func networkFailed() {
        let alert = UIAlertController(title: "네트워크 오류", message: "인터넷 연결을 확인해주세요.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}








@IBDesignable



class CustomTextField: UITextField {
    
   
    
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
}




@IBDesignable

class CustomSearchBar: UISearchBar {
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
}


@IBDesignable

class CustomImageView: UIImageView {
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
}

@IBDesignable
class CustomButton: UIButton {
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
}


@IBDesignable
class CustomView: UIView {
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
}


//헥사코드 사용 가능
extension UIColor{
    convenience init(hex: Int, alpha: CGFloat = 1.0){
        
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat((hex & 0x0000FF) >> 0) / 255.0,
            
            alpha : alpha
        )
    }
}


extension UIView{
    
    
    
    func anchorToTop(top: NSLayoutYAxisAnchor? = nil,
                     left: NSLayoutXAxisAnchor? = nil,
                     bottom: NSLayoutYAxisAnchor? = nil,
                     right: NSLayoutXAxisAnchor? = nil){
        
        anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right,
                                 topConstant: 0, leftConstant: 0, bottomConstant: 0,
                                 rightConstant: 0)
    }
    
    
    
    
    func anchor(top:NSLayoutYAxisAnchor? = nil,
                left : NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                topConstant: CGFloat = 0,
                leftConstant: CGFloat = 0,
                bottomConstant: CGFloat = 0,
                rightConstant: CGFloat = 0,
                widthConstant: CGFloat = 0,
                heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top{
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        if let left = left{
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }
        
        if let bottom = bottom{
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        
        
        if let right = right{
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }
        
        if widthConstant > 0{
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if heightConstant > 0{
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        
        anchors.forEach({$0.isActive = true})
        
        
        return anchors
    }
    
    
    
    
    
    
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil,
                                  left: NSLayoutXAxisAnchor? = nil,
                                  bottom: NSLayoutYAxisAnchor? = nil,
                                  right: NSLayoutXAxisAnchor? = nil,
                                  topConstant: CGFloat = 0,
                                  leftConstant: CGFloat = 0,
                                  bottomConstant: CGFloat = 0,
                                  rightConstant: CGFloat = 0){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
        }
        
        if let left = left{
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        
        if let right = right{
            rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
        }
        
        //anchor 추가
        _ = anchor(top: top, left: left, bottom: bottom, right: right
            , topConstant: topConstant, leftConstant: leftConstant, bottomConstant: bottomConstant, rightConstant: rightConstant)
        
        
    }

}
