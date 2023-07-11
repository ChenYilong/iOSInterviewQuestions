//
//  OrderCellViewModel.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/12.
//

class OrderCellViewModel: RowViewModel, ViewModelClickable {
    var cellPressed: (() -> Void)?
    var product: Product
    init(product: Product) {
        self.product = product
    }
}
