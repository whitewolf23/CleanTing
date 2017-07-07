//
//  SecondViewController.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 27..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit



class BoardViewController: UIViewController {
    
    
    var boardList = [BoardVO]()

    //뷰 생명주기 보길
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//           //        //데이터 불러오기
//                let model = BoardModel(self)
//                model.getBoradList()
//        
        
        
        
//        let button =  UIButton()
//        button.frame = CGRect(x:-100, y:0, width:100,height: 40)
//        button.backgroundColor = UIColor.red
//        button.setTitle("board", for: .normal)
//        button.addTarget(self, action: Selector(("clickOnButton:")), for: UIControlEvents.touchUpInside)
//        self.navigationItem.titleView = button
        
        
        
        
//        let image = UIImage(named: "comment_icon")
//        let imageSize = CGSize(width:60, height: 42)
//        let marginX: CGFloat = (self.navigationController!.navigationBar.frame.size.width / 2) - (imageSize.width / 2)
//        let imageView = UIImageView(frame: CGRect(x: marginX, y: 0, width: imageSize.width, height: imageSize.height))
//        imageView.image = image
//        imageView.contentMode = .scaleAspectFit
        
//        self.navigationItem.titleView = imageView
        
        

        navigationItem.title = "게시판"
        navigationController?.navigationBar.barTintColor = UIColor.white

//        let height: CGFloat = 94
//
//        //이 부분이 없으면 두개 레이어가 보인다
//        let bounds = self.navigationController!.navigationBar.bounds
//        
//        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        //데이터 불러오기
        let model = BoardModel(self)
        model.getBoradList()

    }
    


    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//                //데이터 불러오기
//                let model = BoardModel(self)
//                model.getBoradList()
        

        print("게시판 탭")
        tableView.dataSource = self
        tableView.delegate = self
        
        // separator 변경이 안됨 
        // 이미지로 삽입해서 대체 하는 방법이 존재 
//        let seperatorImageView = UIImageView.init(image: UIImage.init(named: "yourseperatorimg.jpg"))
//        seperatorImageView.frame = CGRectMake(0, cell.contentView.frame.size.height - 1.0,  cell.contentView.frame.size.width, 1)
//        cell.contentView.addSubview(seperatorImageView
        
        
        //tablview xib
        self.tableView.register(UINib(nibName: "BoardViewTableCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        
    }
    
    
    
    
}

extension BoardViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    //한 섹션당 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boardList.count
        
//        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BoardViewTableCell
        
        
        let boardVO  = boardList[indexPath.row]

        
        cell.b_Title.text = boardVO.title
       cell.b_Content.text = boardVO.content
        cell.b_Date.text = boardVO.date
        cell.b_time.text = boardVO.time
        
        let com_cnt = boardVO.comment_cnt
        cell.b_Comment_count.text = "댓글 : \(gino(com_cnt))"
        
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//
//        //네비게이션
//        self.navigationController?.pushViewController(nvc, animated: true)
        
//        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "BoardDetailViewController") as? BoardDetailViewController else{
//            return
//        }
        let boardVO = boardList[indexPath.row]

       

        let dvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BoardDetailViewController") as! BoardDetailViewController

        self.navigationController?.pushViewController(dvc, animated: true)

        dvc.postId = boardVO.postId
    }
    
    
    //xib 셀 높이 여기서 반영
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
    
}

extension BoardViewController: NetworkCallback{



    func networkResult(resultData: Any, code: String) {
       
        
        if code == "board"{
            boardList = resultData as! [BoardVO]
//            print("게시판 JSON : \(boardList)")
            tableView.reloadData()
        }
        
        
    }
    
    
    
    
    
}
