//
//  ChooseViewController.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 30..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController{
  
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
extension ChooseViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        
        
        return cell
    }
    
    
    //tableviewcell heigth
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("내 지역 모집 현황")
        
        let nvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ApplyRegionViewController") as! ApplyRegionViewController
        
        
        //네비게이션
        self.navigationController?.pushViewController(nvc, animated: true)
        nvc.navigationItem.title = "내 지역 모집 현황"
    }
    
}

