//
//  EditApplyViewController.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 6..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit


class EditApplyViewController: UIViewController{
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 500)
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        //탭바 숨기기
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    
    
    
}

extension EditApplyViewController{
    
    
    
    
}


