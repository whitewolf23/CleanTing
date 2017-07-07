//
//  BoardDetailViewController.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 28..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit
import Toaster

class BoardDetailViewController: UIViewController{
    
    
    
    
    @IBOutlet weak var title_txt: UILabel!
    
    
    @IBOutlet weak var content_txt: UILabel!
    
    
    @IBOutlet weak var date_txt: UILabel!
    
    
    @IBOutlet weak var time_txt: UILabel!
    
    
    @IBOutlet weak var comment_num: UILabel!
    
    
    @IBOutlet weak var comment_tf : UITextField!
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var stroed_userId = UserDefaults.standard.string(forKey: "userId")
    
    
    
    //댓글 작성
    @IBAction func comment_action(_ sender: Any) {
    
        let writer = gsno(stroed_userId)
        let content = gsno(comment_tf.text)
        
        comment_tf.text = ""
        
        let model = WriteCommentModel(self)
        model.writeComment(id: gino(postId), writer: writer, content: content)
        
        Toast(text:"댓글성공").show()
        ToastView.appearance().backgroundColor = UIColor.init(hex: 0xF2D457)
        ToastView.appearance().textColor = UIColor.black
       
        //자동 백
        navigationController?.popViewController(animated: true)
        print("댓글성공")
    }
    
    
    
    
    
    
    var commentList = [CommentVO]()
    
    var boardDetail : BoardVO?
    
    var postId : Int?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("저장된 유저 아이디 : \(gsno(stroed_userId))")
        
        
        if let detailID = postId {
            let model = BoardDetailModel(self)
            print(detailID)
            model.getBoardDetail(id: detailID)
        }
        
        //테이블뷰 자체 크기보다 누적되어있는 셀들의 높이들의 합이 더 작을경우( 테이블뷰에 셀이 한두개만있고 나머지 셀은 비어있는 상태)
        //해당 코드로 보기싫은 밑줄들을 지워줍니다
        //쉽게생각해서 비어있는 셀들을 뷰로 덮어버리는거라고 생각하시면됩니다
        tableView.tableFooterView = UIView.init(frame: CGRect.zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //tablview xib
        self.tableView.register(UINib(nibName: "BoardDetailCell", bundle: nil), forCellReuseIdentifier: "cell")
        

    }
}

extension BoardDetailViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    //한 섹션당 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList.count
        
        
        //        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var row  = commentList[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BoardDetailCell
        
//        @IBOutlet weak var content : UILabel!
//        @IBOutlet weak var d_userid : UILabel!
//        @IBOutlet weak var date : UILabel!
//        @IBOutlet weak var time : UILabel!
     
        cell.content.text = row.content
        cell.d_userid.text = row.userId
        cell.time.text = row.time
        cell.date.text = row.date
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        
        
//        let dvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BoardDetailViewController") as! BoardDetailViewController
//        
//        self.navigationController?.pushViewController(dvc, animated: true)
//        
        
    }
    
    
    //xib 셀 높이 여기서 반영
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    
    
}



extension BoardDetailViewController : NetworkCallback{
    
    func networkResult(resultData: Any, code: String) {
        
        //게시글내용을 분기해서 가져옵니다
        if code == "board2"{
            
            boardDetail = resultData as! BoardVO
           
            postId = gino(boardDetail?.postId)
            title_txt.text = gsno(boardDetail?.title)
            comment_num.text = "댓글 : \(gino(boardDetail?.comment_cnt))"
            content_txt.text = gsno(boardDetail?.content)
            date_txt.text = gsno(boardDetail?.date)
            time_txt.text = gsno(boardDetail?.time)
            //            image.imageFromUrl(gsno(boardDetail?.image_url), defaultImgPath: "symbol")

        }
        
        //else if 구문을 쓰면 안됩니다. else if 구문을 써버리면 if code == "1-2-post" 구문에서 데이터들을 가져온 이후에
        //해당 조건문을 실행하지 않습니다.
        //동시에 두 가지이상의 데이터종류를 가져올 때는 if ~ else if 구문이 아닌 if , if 구문을 사용해주세요
        if code == "comment"{
            
            commentList = resultData as! [CommentVO]
            tableView.reloadData()
            
        }
            
        if code == "commmentSuccess"{
            let msg = resultData as! String
         
            Toast(text:"\(msg)").show()
            ToastView.appearance().backgroundColor = UIColor.init(hex: 0xF2D457)
            ToastView.appearance().textColor = UIColor.black
      
            if let detailID = postId {
                let model = BoardDetailModel(self)
                print(detailID)
                model.getBoardDetail(id: detailID)
            }
        }
    }

}
