//
//  ViewController.swift
//  ExpandableTableView
//
//  Created by RakeshPC on 07/07/19.
//  Copyright © 2019 RakeshPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var expandableTableVIew: UITableView!
    
    var tableData = [TableData(title: "Title1", subTitle: ["subtile1", "subtile2"], isExpand: false),
                     TableData(title: "Title1", subTitle: ["subtile1", "subtile2", "subtile3"], isExpand: false),
                     TableData(title: "Title1", subTitle: ["subtile1", "subtile2","subtile3","subtile4"], isExpand: false),
                     TableData(title: "Title1", subTitle: ["subtile1", "subtile2","subtile3","subtile4","subtile5"], isExpand: false),
                     TableData(title: "Title1", subTitle: ["subtile1", "subtile2"], isExpand: false)
                    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expandableTableVIew.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        headerView.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)
        headerView.delegate = self
        headerView.sectionIndex = section
        headerView.btn.setTitle(tableData[section].title, for: .normal)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableData[section].isExpand {
            return tableData[section].subTitle.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = expandableTableVIew.dequeueReusableCell(withIdentifier: "cells")
        cell?.textLabel?.text = tableData[indexPath.section].subTitle[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tableData[indexPath.section].subTitle[indexPath.row])
    }
}

extension ViewController: HeaderViewDelegate {
    func cellHeader(idx: Int) {
        tableData[idx].isExpand = !tableData[idx].isExpand
        expandableTableVIew.reloadSections([idx], with: .automatic)
    }
}
