//
//  MyCustomCell.swift
//  SwiftUI101
//
//  Created by chenyilong on 2023/8/1.
//

import Foundation
import SwiftUI

struct MyCustomCell: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    // In UIKit, you might set the textLabel?.text property of UITableViewCell
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    // In UIKit, you might set the detailTextLabel?.text property of UITableViewCell
            }
            Spacer()
        }
        .padding(.vertical, 8)
        .background(Color.blue)

    }

}
