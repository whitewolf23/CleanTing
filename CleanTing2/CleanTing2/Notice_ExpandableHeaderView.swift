//
//  a.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 4..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit


protocol Notice_ExpandableHeaderViewDelegate {
    func toggleSection(header : Notice_ExpandableHeaderView, section: Int)
}


class Notice_ExpandableHeaderView : UITableViewHeaderFooterView{
    
    var delegate : Notice_ExpandableHeaderViewDelegate?
    
    var section : Int!
    
    
    
    override init(reuseIdentifier : String?){
        super.init(reuseIdentifier: reuseIdentifier)
        //함수 추가
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectSectionHeader(gestureRecognizer:))))
    }
    
    //헤더 탭 할시 작동
    func selectSectionHeader(gestureRecognizer : UITapGestureRecognizer){
        let cell = gestureRecognizer.view as! Notice_ExpandableHeaderView
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    //ch
    func customInit(title: String ,section: Int, delegate: Notice_ExpandableHeaderViewDelegate){
        
        
        self.textLabel?.text = title
        //        self.textLabel?.text = next_title
        self.section = section
        self.delegate = delegate
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //타이틀
        self.textLabel?.textColor = UIColor.white
        
        //        //타이틀 옆 라벨
        //        self.textLabel?.textColor = UIColor.red
        //        self.backgroundColor = UIColor.init(hex: 0xF2D457)

        self.contentView.backgroundColor = UIColor.init(hex: 0xF2D457)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
