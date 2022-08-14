//
//  iOSTestTests.swift
//  iOSTestTests
//
//  Created by Vishnu Sasikumar on 10/11/21.
//

import XCTest
@testable import iOSTest

class iOSTestTests: XCTestCase {
    var orderListViewController: OrderListViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let navController = storyboard.instantiateViewController(identifier: "NavigationController") as? UINavigationController;
        orderListViewController = navController?.viewControllers[0] as? OrderListViewController
        orderListViewController.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /*!
     * Order(
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
     */
    func testGetOrderTotal() throws {
        
        XCTAssertEqual(orderListViewController.viewModel.orders.value.count, 4)

        
        let orders = orderListViewController.viewModel.orders.value;
        XCTAssertEqual(orders[0].getOrderTotal(), 39.22)
        XCTAssertEqual(orders[0].getGSTTotal(), 5.883)

        XCTAssertEqual(orders[1].getOrderTotal(), 39.22)
        XCTAssertEqual(orders[1].getGSTTotal(), 5.883)
        
        XCTAssertEqual(orders[2].getOrderTotal(), 50.7)
        XCTAssertEqual(orders[2].getGSTTotal(), 7.605)

        XCTAssertEqual(orders[3].getOrderTotal(), 173.204)
        XCTAssertEqual(orders[3].getGSTTotal(), 25.9806)

    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
