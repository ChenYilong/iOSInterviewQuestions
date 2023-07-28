//
//  BaseCell.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/25.
//

import Foundation
import UIKit

class BaseCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseCell: ClassIdenfifiable {
    static var reuseIdentifier: String {
        return "default"
    }
    
    static var reuseIdentifier2: String {
        return "B"
    }
}
