//
//  NoticeViewController.swift
//  CleanTing2
//
//  Created by 김민수 on 2017. 7. 4..
//  Copyright © 2017년 김민수. All rights reserved.
//

import UIKit



class NoticeViewController: UIViewController{
    
   

    @IBOutlet weak var tableView: UITableView!

    
    //
    lazy var sections : [Notice_Expendable_Section] = {
        
        let section1 = Notice_Expendable_Section(title : "Group0", data: "0", expendable: true)
       
        let section2 = Notice_Expendable_Section(title: "Group1",  data: "0" , expendable: false)
        
        let section3 = Notice_Expendable_Section(title: "Group2", data: "0" , expendable: true)
        
        
        return [section1, section2,section3]
        
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        self.tableView.register(UINib(nibName: "NoticeTableCell", bundle: nil), forCellReuseIdentifier: "n_cell")
        navigationController?.navigationBar.barTintColor = UIColor.white

    }
    
    
    
    
    
    
}


extension NoticeViewController:UITableViewDelegate, UITableViewDataSource, Notice_ExpandableHeaderViewDelegate{
    
    
    
    
    func toggleSection(header: Notice_ExpandableHeaderView
        , section: Int) {
        sections[section].expendable = !sections[section].expendable
        tableView.beginUpdates()
        
        
        for i in 0 ..< sections[section].data.count{
            tableView.reloadRows(at: [IndexPath(row : i, section: section)], with: .automatic)
            
        }
        tableView.endUpdates()
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
        
    }
    
    //섹션당 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].data.count
    }
    
    
    
    
    //헤더 높이
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        
                if(sections[indexPath.section].expendable){
                    return 100
                }else{
                    return 0
                }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let header = Notice_ExpandableHeaderView()
        
        
        header.customInit(title: sections[section].title, section: section, delegate: self as Notice_ExpandableHeaderViewDelegate)
        
        
        return header
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = sections[indexPath.section].data[indexPath.row]
        
        
//        //주소
//        if indexPath.section == 0 && indexPath.item == 0 {
//            
//            let cell = tableView.dequeueReusableCell(withIdentifier: "n_cell", for: indexPath)
//            cell.selectionStyle = .none
//            return cell
//            
//        }
        
        
        
        
//                else{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "n_cell", for: indexPath) as! NoticeTableCell
            
//                        cell1.textLabel?.text = row
            //
//            if indexPath.section == 2 && indexPath.item == 0 {
//                cell1.accessoryType = .disclosureIndicator
//            }
            //                else if indexPath.section == 0 && indexPath.item == 1{
            //                cell1.accessoryType = .disclosureIndicator
            //            }
            //            else {
            //                cell1.accessoryType = .none
            //            }
            
            //            cell1.selectionStyle = .none
            return cell1
            
//        }
        
        
        
    }
    

    
}
