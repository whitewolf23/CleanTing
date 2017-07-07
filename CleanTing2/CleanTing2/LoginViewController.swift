//
//  LoginViewController.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 27..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit
import Toaster

class LoginViewController : UIViewController, UITextFieldDelegate{
    
    //데모계정
    //id : bumma
    //pwd : 2222
    
    
    var Bool : Bool = false
    
    var token_data : String?
    
    var uservo = [UserVO]()
    var userlist = [UserListVO]()
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var idTextfiled : UITextField!
    @IBOutlet weak var pwTextfiled : UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "token") != nil {
            let token = UserDefaults.standard.string(forKey: "token")
            print("로그인 뷰 토우큰 : \(token)")
        }else{
            print("토큰이 읍슈")
        }
        
        if UserDefaults.standard.object(forKey: "userId") != nil {
            let userId = UserDefaults.standard.string(forKey: "userId")
            print("로그인 뷰 유저아이디 : \(userId)")
        }else{
            print("저장된 유저아이디가 읍슈")
        }
        
        
        
        idTextfiled.delegate = self
        pwTextfiled.delegate = self
       
    }
    
    @IBAction func LoginAction(_ sender: Any) {
       
        let id = idTextfiled.text!
        let pw = pwTextfiled.text!
        
        if ((id.isEmpty) || (pw.isEmpty)){
            
            onLogin(status: "FAILED")
        }else{
            onLogin(status: "OK")
            
        }
        
    }
    
    
    //로그인 분기점
    func onLogin(status: String) {
        
        switch status {
        // 로그인 성공
        case "OK":
            onLoginOK()
            break
        // 로그인 실패시
        case "FAILED":
            onLoginFAILED()
            break
        // 디폴트값
        default: break
        }
    }
    
    
    //로그인 실패
    func onLoginFAILED(){
        
        Toast(text:"아이디 또는 비밀번호를 입력하세요").show()
        ToastView.appearance().backgroundColor = UIColor.init(hex: 0xF2D457)
        ToastView.appearance().textColor = UIColor.black
        
    }
    
    
    //로그인 성공
    func onLoginOK(){
        
        let id = idTextfiled.text!
        let pw = pwTextfiled.text!
        
        print("입력한 아이디 : \(id)")
        print("입력한 비밀번호 : \(pw)")
        
        if NetWorkUtil.isConnectedToNetwork() == false {
            
            
            Toast(text:"네트워크 연결을 확인하세요.").show()
            ToastView.appearance().backgroundColor = UIColor.init(hex: 0xF2D457)
            ToastView.appearance().textColor = UIColor.black
            
            
        }else{
            
            
            
            let model = UserModel(self)
            model.getUserInfo(userId: gsno(id), pwd: gsno(pw))
            
            
//            let token = userlist[0].token
//            print("토우큰 : \(token)")
           
            
            process(code: "OK")
            

           
            
            
        }
        
        
    }
    
    
    
    func process(code : String){
        
        if code == "OK"{
       
        //성공한다면 넘어간다
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabbarController")
        self.present(vc, animated: true, completion: nil)
        
            
        print("로그인 버튼 클릭 ")
            
            let when = DispatchTime.now() + 0.6// change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
        let userId = UserDefaults.standard.string(forKey: "userId")
            print("로그인 유저아이디 : \(userId!)")
                
            }
        //토스트 메세지
        Toast(text: "로그인 성공 하였습니다. ").show()
        ToastView.appearance().backgroundColor = UIColor.init(hex: 0xF2D457)
        ToastView.appearance().textColor = UIColor.black
        }
        
    }
    
    
    
    
}


extension LoginViewController: NetworkCallback{
    
    
   
    
    
    
    func networkResult(resultData: Any, code: String) {
        
        
        
        if code == "loginSuccess"{
            
            uservo = [resultData as! UserVO] //[] -> x, {} -> 0
            userlist = [resultData as! UserListVO]
            
//            let queue = DispatchQueue.global()
//            queue.async { () -> Void in
//               
//                
//                if self.userlist[0].token != nil{
//                    self.token_data = self.userlist[0].token
//                    print("로그인 뷰 토우큰 : \(self.token_data)")
//                }else{
//                    print("로그인 뷰 토우큰:토큰 데이터가 없다")
//                }
//            
//            }
//           
           
         
            
//            Bool = !Bool
//            if Bool == true{
//                process(code: "OK")
//                
//            }
//            LoginButton.addTarget(self, action: #selector(process), for: .touchUpInside)
        }
        
        
        if code == "loginError"{
            
            Toast(text:"존재하지 않는 계정입니다.").show()
            ToastView.appearance().backgroundColor = UIColor.init(hex: 0xF2D457)
            ToastView.appearance().textColor = UIColor.black
            
        }
        
        if code == "loginError2"{
            
            Toast(text:"비밀번호가 틀렸습니다.").show()
            ToastView.appearance().backgroundColor = UIColor.init(hex: 0xF2D457)
            ToastView.appearance().textColor = UIColor.black
            
        }
        
        
    }
    
    
    
    
}





//    func userLogin() {
//        guard let userid = self.idTextField.text, !userid.isEmpty else { return }
//        guard let password = self.pwTextField.text, !password.isEmpty else { return }
//
//        if NetWorkUtil.isConnectedToNetwork() == false {
//            Toast(text:"네트워크 연결을 확인하세요.").show()
//        } else {
//
//            AuthService.login(userid: userid, password: password) {  (success) -> () in
//                switch (success) {
//                case true: print("성공했다")
//                self.appDelegate.timerPlay()
//                let userDefaults = Foundation.UserDefaults.standard
//                userDefaults.set(userid, forKey: "stuid")
//                userDefaults.set(password, forKey: "stupw")
//                userDefaults.set(self.autoLoginButton.isChecked, forKey:"autoLogin")
//
//                print(gsno(userDefaults.string(forKey: "autoLogin")))
//
//                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainnavcontroller")
//                self.present(vc, animated: false, completion: nil)
//
//
//
//                break;
//
//                case false: print("실패했다")
//                Toast(text:"학번 혹은 비밀번호가 틀립니다.").show()
//                }
//
//            }
//        }
//
//    }
//
//
