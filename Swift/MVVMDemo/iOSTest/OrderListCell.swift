//
//  OrderCell.swift
//  iOSTest
//
//  Created by chenyilong on 2022/7/20.
//

import UIKit

class OrderListCellViewModel: RowViewModel, ViewModelClickable {
    var cellPressed: (() -> Void)?

    var order: Order

    init(order: Order) {
        self.order = order
    }
}

class OrderListCell: UITableViewCell {
    @IBOutlet var descriptionLabel: UILabel!

    @IBOutlet var orderDateLabel: UILabel!

    @IBOutlet var deliveryDateLabel: UILabel!

    @IBOutlet var productsLabel: UILabel!

    var cellViewModel: OrderListCellViewModel? {
        didSet {
            descriptionLabel.text = cellViewModel?.order.description
            orderDateLabel.text = cellViewModel?.order.orderDate
            deliveryDateLabel.text = cellViewModel?.order.deliveryDate

            let productsList = cellViewModel?.order.products as? [Product]
            var productsString = ""
            for project in productsList ?? [] {
                productsString.append("- " + project.description + "\n")
            }
            productsLabel.text = productsString
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
    }

    func initView() {
        backgroundColor = UIColor(red: CGFloat(arc4random_uniform(256)) / 255.0, green: CGFloat(CGFloat(arc4random_uniform(256))) / 255.0, blue: CGFloat(arc4random_uniform(256)) / 255.0, alpha: 1.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
