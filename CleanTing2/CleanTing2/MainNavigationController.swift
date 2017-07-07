//
//  MainNavigationController.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 3..
//  Copyright © 2017년 김민수. All rights reserved.
//



import UIKit

class MainNavigationController: UINavigationController {
    
    var navBar: UINavigationBar = UINavigationBar()

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setNavBarToTheView()

        
    }
    
    func setNavBarToTheView() {
        self.navBar.frame = CGRect(x:0, y:0, width:415, height:94)  // Here you can set you Width and Height for your navBar
//        self.navBar.backgroundColor = (UIColor.blackColor())
        self.view.addSubview(navBar)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UIApplication.shared.keyWindow?.rootViewController = self
        
        // Do any additional setup after loading the view.
    }
    

}
