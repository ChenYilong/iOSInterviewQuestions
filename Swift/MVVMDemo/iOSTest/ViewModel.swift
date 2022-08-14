//
//  ViewModel.swift
//  iOSTest
//
//  Created by Vishnu Sasikumar on 10/11/21.
//

import Foundation

class ViewModel: RowViewModel {
    var orders = Observable<[Order]>(value: [])
    var productsList : Array<Product> = [];
    var orderListCellViewModels : Array<OrderListCellViewModel> = Array();

    init() {
        let PRODUCT_1 = Product(
            productCode: 136341,
            description: "Chicken Balls Garlic",
            brand: "Caterer's Choice",
            price: 15.47,
            quantity: 2.0
        )
        let PRODUCT_2 = Product(
            productCode: 172488,
            description: "Beef Rump G/Fed",
            brand: "Meat",
            price: 17.87,
            quantity: 3.2
        )
        let PRODUCT_3 = Product(
            productCode: 58220,
            description: "Tomato Puree",
            brand: "",
            price: 8.28,
            quantity: 1.0
        )
        let PRODUCT_4 = Product(
            productCode: 183968,
            description: "Chips 10mm French Fries Straight Cut",
            brand: "Jeffersons",
            price: 26.10,
            quantity: 1.0
        )
        let PRODUCT_5 = Product(
            productCode: 64996,
            description: "Chocolate Buttons Milk",
            brand: "Caterers Choice",
            price: 10.14,
            quantity: 5.0
        )

        orders = Observable<[Order]>(value:[
            Order(
                id: 4937,
                description: "Friday Order",
                orderDate: "2020-09-25",
                deliveryDate: "2020-09-26",
                products: [PRODUCT_1, PRODUCT_3]
            ),
            Order(
                id: 1804,
                description: "Meats",
                orderDate: "2020-08-11",
                deliveryDate: "2020-08-12",
                products: [PRODUCT_1, PRODUCT_3]
            ),
            Order(
                id: 9639,
                description: "Chocolate",
                orderDate: "2020-11-02",
                deliveryDate: "2020-11-03",
                products: [PRODUCT_5]
            ),
            Order(
                id: 2709,
                description: "Big Order",
                orderDate: "2020-06-09",
                deliveryDate: "2020-06-10",
                products: [PRODUCT_1, PRODUCT_2, PRODUCT_3, PRODUCT_4, PRODUCT_5]
            )
        ])
    }

}
