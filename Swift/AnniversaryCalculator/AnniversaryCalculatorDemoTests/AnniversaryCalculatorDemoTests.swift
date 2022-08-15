//
//  AnniversaryCalculatorDemoTests.swift
//  AnniversaryCalculatorDemoTests
//
//  Created by chenyilong on 2022/8/15.
//

import XCTest
@testable import AnniversaryCalculatorDemo


class TestViewModel {

    var couples: [Couple] = []
    var couplesToRemind: [Couple] = [];

    init() {
        let Couple_1 = Couple(
            coupleId: "1",
            anniversary: Date.ISOStringFromDate(date: Date().after(days: (-365+1)))
        )
        let Couple_2 = Couple(
            coupleId: "2",
            anniversary: Date.ISOStringFromDate(date: Date().after(days: (-365+2)))
           
        )
        let Couple_3 = Couple(
            coupleId: "3",
            anniversary: Date.ISOStringFromDate(date: Date().after(days: (-365*5-6)))//"2017-8-08T03:07:33.457Z"
            
        )
        let Couple_4 = Couple(
            coupleId: "4",
            anniversary: Date.ISOStringFromDate(date: Date().after(days: (-365*5-5)))//"2017-8-22T03:07:33.457Z"
            
        )
        let Couple_5 = Couple(
            coupleId: "5",
            anniversary: Date.ISOStringFromDate(date: Date().after(days:(-365*10-13)))//"2012-8-01T03:07:33.457Z"
        )
        let Couple_6 = Couple(
            coupleId: "6",
            anniversary: Date.ISOStringFromDate(date: Date().after(days: (-365*10-12)))//"2012-8-15T03:07:33.457Z"
        )
        couples = [
            Couple_1,
            Couple_2,
            Couple_3,
            Couple_4,
            Couple_5,
            Couple_6
        ]
    }

}

var testViewModel: TestViewModel = TestViewModel()

class AnniversaryCalculatorDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        for couple in testViewModel.couples {
            XCTAssertTrue(couple.shouldAnniversaryToRemind())
            
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
