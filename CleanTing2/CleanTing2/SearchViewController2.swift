//
//  SearchViewController2.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 1..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit
import Kingfisher


class SearchViewController2: UIViewController, UISearchBarDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!

    var latelyvo = [CleanerLatelyVO]()
    
    
    var searchFlag = true

    let userId = UserDefaults.standard.string(forKey: "userId")
    
    
    //
    @IBAction func backAction(_ sender: Any) {
        if searchFlag {
            //self.dismiss(animated: false, completion: nil)
            self.navigationController?.navigationBar.isHidden = false
            navigationController?.popViewController(animated: true)
            
        } else {
            self.searchFlag = true
        }
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        
        
        let model = LatelyModel(self)
        model.getCleanerLately(userId: gsno(userId))
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        searchBar.delegate = self

        //colletionview xib 연결
        
        self.collectionView.register(UINib(nibName: "RecentCleanerCell2", bundle: nil), forCellWithReuseIdentifier: "cell1")
        
        
        
        //별점순 클리너 등록
        self.tableView.register(UINib(nibName: "SearchTableCell", bundle: nil), forCellReuseIdentifier: "cell2")
    }
}


//컬렉션 뷰
extension SearchViewController2: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    
    //섹션당 셀 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return latelyvo.count
        
    }
    
    
    
    
    //셀 내용
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! RecentCleanerCell2
        
        let item = latelyvo[indexPath.row]

        //이미지
        if let url = URL(string: gsno(item.image)){
            cell.imageview.kf.setImage(with: url)
            cell.imageview.contentMode = .scaleAspectFit
        }
        
        
        cell.name.text = gsno(item.name)
        cell.date.text = gsno(item.date)
        cell.star_rating.rating = gino(item.rate)

        
        
        
        
        
        return cell
        
        
        
        
        
    }
    
    
    //셀 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150  , height: 200)
    }
    
    
    //셀 선택시
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        print("나의 신청 현황")
        print("선택한 컬렉션 뷰 셀 : \(indexPath.row)")
    
        
        
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


extension SearchViewController2: NetworkCallback{
    
    
    func networkResult(resultData: Any, code: String) {
        
        if code == "SUCCESS"{
            latelyvo = resultData as! [CleanerLatelyVO]
        }
        
        collectionView.reloadData()
        tableView.reloadData()
    }
    
}
