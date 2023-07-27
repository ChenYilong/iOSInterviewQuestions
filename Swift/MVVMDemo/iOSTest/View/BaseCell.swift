//
//  BaseCell.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/25.
//

import Foundation
import UIKit

class BaseCell: UITableViewCell, ClassIdenfifiable {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
