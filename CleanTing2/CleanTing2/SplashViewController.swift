//
//  SplashViewController.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 27..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    var timer = Timer()
    let userDefaults = Foundation.UserDefaults.standard
    let queue = DispatchQueue.global()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { (timer) in
            //메인 스토리보드의 로그인 페이지로 이동한다.
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
            self.present(vc, animated: true, completion: nil)
        })
        
    }
    
}
