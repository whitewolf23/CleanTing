//
//  SearchViewController2.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 1..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit


class SearchViewController2: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //colletionview xib 연결
        
        self.collectionView.register(UINib(nibName: "RecentCleanerCell2", bundle: nil), forCellWithReuseIdentifier: "cell1")
        
        
        
        //별점순 클리너 등록
        self.tableView.register(UINib(nibName: "SearchTableCell", bundle: nil), forCellReuseIdentifier: "cell2")
    }
}


//컬렉션 뷰
extension SearchViewController2: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    //        //Here you set the number of cell in your collectionView
    //        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //            return max(players.count,numberOfCells);
    //        }
    //
    //         func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //
    //            if((indexPath.row + 1) < self.players.count){ //If index of cell is less than the number of players then display the player
    //
    //                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! HomeCollectionViewCell
    ////                cell.labelText.text = self.players[indexPath.row] //Display player
    //                return cell;
    //
    //            }else{//Else display DefaultCell
    //                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tingcell", for: indexPath as IndexPath) as! CreateTingCell
    //                return cell;
    //            }
    //        }
    
    
    
    //섹션당 셀 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
        
    }
    
    
    
    
    //셀 내용
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! RecentCleanerCell2
        
        return cell1
        
        
        
        
        
    }
    
    
    //셀 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150  , height: 200)
    }
    
    
    //셀 선택시
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        print("나의 신청 현황")
        print("선택한 컬렉션 뷰 셀 : \(indexPath.row)")
        
        
        //        let row = indexPath.row
        //
        //        if((row + 1) < self.players.count){
        //            let nvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ApplyInfoViewController") as! ApplyInfoViewController
        //
        //
        //            //네비게이션
        //            self.navigationController?.pushViewController(nvc, animated: true)
        //            nvc.navigationItem.title = "나의 신청 현황"
        //
        //
        //            //네비게이션 컬
        //            nvc.navigationController?.navigationBar.tintColor = UIColor.init(hex: 0xF2D457)
        //
        //            //네비게이션 - 텍스트 컬러
        //            let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.init(hex: 0xF2D457)]
        //            nvc.navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : Any]
        //
        //            nvc.navigationController?.navigationBar.barTintColor = UIColor.white
        //
        //            //백 버튼
        //            let backItem = UIBarButtonItem()
        //            backItem.title = ""
        //            nvc.navigationItem.backBarButtonItem = backItem
        //
        //
        //        }else{
        //            print("맨 마지작 셀은 작동 아됨")
        //        }
        //
        //
        //    }
        
        
        
    }
    
    
}
    
    //tableview
    extension SearchViewController2: UITableViewDelegate, UITableViewDataSource{
        
        
        func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! SearchTableCell
            
            return cell
        }
        
        
        //tableviewcell heigth
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
            
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            print("내 지역 모집 현황")
            //
            //        let nvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ApplyRegionViewController") as! ApplyRegionViewController
            //        
            //        
            //        //네비게이션
            //        self.navigationController?.pushViewController(nvc, animated: true)
            //        nvc.navigationItem.title = "내 지역 모집 현황"
        }
        
}
