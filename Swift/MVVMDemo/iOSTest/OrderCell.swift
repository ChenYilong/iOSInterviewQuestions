//
//  OrderCell.swift
//  iOSTest
//
//  Created by chenyilong on 2022/7/20.
//

import UIKit

class OrderCellViewModel: RowViewModel, ViewModelClickable {
    var cellPressed: (() -> Void)?
    var product: Product
    init(product: Product) {
        self.product = product
    }
}

class OrderCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    var cellViewModel: OrderCellViewModel? {
        didSet {
            descriptionLabel.text = cellViewModel?.product.description;
            brandLabel.text = cellViewModel?.product.brand;
            let price: Double = cellViewModel?.product.price ?? 0;
            priceLabel.text = String(format: "%.1f", price);
            
            let quantity: Double = cellViewModel?.product.quantity ?? 0;
            quantityLabel.text = String(format: "%.1f", quantity);
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
    }
    
    func initView() {
        backgroundColor = UIColor(red:CGFloat(arc4random_uniform(256))/255.0, green:CGFloat(CGFloat(arc4random_uniform(256)))/255.0 , blue:CGFloat(arc4random_uniform(256))/255.0, alpha: 1.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
