//
//  ExpendableHeaderView.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 6. 29..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit


protocol ExpandableHeaderViewDelegate {
    func toggleSection(header : ExpandableHeaderView, section: Int)
}


class ExpandableHeaderView : UITableViewHeaderFooterView{
  
    var delegate : ExpandableHeaderViewDelegate?
    
    var section : Int!
    
    
    
    override init(reuseIdentifier : String?){
        super.init(reuseIdentifier: reuseIdentifier)
        //함수 추가
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectSectionHeader(gestureRecognizer:))))
    }
    
    //헤더 탭 할시 작동
    func selectSectionHeader(gestureRecognizer : UITapGestureRecognizer){
        let cell = gestureRecognizer.view as! ExpandableHeaderView
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    //ch
    func customInit(title: String ,section: Int, delegate: ExpandableHeaderViewDelegate){
        
        
        self.textLabel?.text = title
//        self.textLabel?.text = next_title
        self.section = section
        self.delegate = delegate
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //타이틀
        self.textLabel?.textColor = UIColor.darkGray
        
//        //타이틀 옆 라벨
//        self.textLabel?.textColor = UIColor.red
        
        self.contentView.backgroundColor = UIColor.white
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
