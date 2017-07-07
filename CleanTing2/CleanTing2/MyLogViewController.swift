//
//  MyLogViewController.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 5..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit

class MyLogViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        navigationItem.title = "나의 이용 내역"
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        
        let backButtonImage: UIImage = UIImage(named: "back")!
        var _: UIBarButtonItem = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(preview))
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //필수 연결
        tableView.delegate = self
        tableView.dataSource = self
        
        //xib 연결
        self.tableView.register(UINib(nibName: "MyLogCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        
    }
    
    
    
    
  
    
    func preview(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}



extension MyLogViewController : UITableViewDelegate, UITableViewDataSource{
    
    //한 섹션당 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return boardList.count
        
                return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyLogCell
        
        
        
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        
        
//        let dvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BoardDetailViewController") as! BoardDetailViewController
//        
//        self.navigationController?.pushViewController(dvc, animated: true)
        
        
    }
    
    
    //xib 셀 높이 여기서 반영
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }

}
