//
//  Order.swift
//  iOSTest
//
//  Created by Vishnu Sasikumar on 10/11/21.
//

import Foundation

struct Order {
    let id: Int
    let description: String
    let orderDate: String
    let deliveryDate: String?
    let products: [Product]
    
    // Returns total value of products in order
    func getOrderTotal() -> Double {
        //TODO
        return products.reduce(0.0) { total, product in
            return total + product.price * product.quantity
        }
    }
    
    // Returns total value of products in order
    func getGSTTotal() -> Double {
        return self.getOrderTotal() * 0.15
    }
    
    
    func descriptionString() -> String {
        let priceTotal = self.getOrderTotal();
        let priceTotalString = String(format: "%.1f", priceTotal);
        
        let GST = self.getGSTTotal();
        let GSTTotalString = String(format: "%.1f", GST);

        
        return "price total:" + priceTotalString + " and GST:" + GSTTotalString;
    }
}
