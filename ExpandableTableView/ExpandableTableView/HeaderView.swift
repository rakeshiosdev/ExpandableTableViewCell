//
//  HeaderView.swift
//  ExpandableTableView
//
//  Created by RakeshPC on 07/07/19.
//  Copyright © 2019 RakeshPC. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate {
    func cellHeader(idx: Int)
}

class HeaderView: UIView {

    var sectionIndex: Int?
    var delegate: HeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(btn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var btn: UIButton = {
        let btn = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height))
        btn.titleLabel?.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        btn.addTarget(self, action: #selector(touchHeaderView), for: .touchUpInside)
        return btn
    }()

    @objc func touchHeaderView(){
        if let index = sectionIndex {
            delegate?.cellHeader(idx: index)
        }
    }
}
