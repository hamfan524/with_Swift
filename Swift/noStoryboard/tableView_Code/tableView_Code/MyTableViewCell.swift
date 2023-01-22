//
//  myTableViewCell.swift
//  tableView_Code
//
//  Created by 최동호 on 2023/01/22.
//

import Foundation
import SnapKit
import UIKit

class MyTableViewCell: UITableViewCell{
    static let identifier = "MyTableViewCell"
    
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        contentView.addSubview(myLabel)
        
        myLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(15)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.trailing.equalTo(contentView.snp.trailing).offset(16)
        }
        
    }
    
}
