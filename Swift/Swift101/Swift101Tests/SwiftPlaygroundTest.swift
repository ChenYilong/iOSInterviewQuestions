//
//  SwiftPlaygroundTest.swift
//  Swift101Tests
//
//  Created by chenyilong on 2024/2/25.
//

import Foundation
import XCTest
import UIKit

import XCTest
@testable import Swift101

final class SwiftPlaygroundTest: XCTestCase {
    
    override func setUpWithError() throws {
        print("SwiftPlaygroundTest")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    //    func testPerformanceExample() throws {
    //        // This is an example of a performance test case.
    //        self.measure {
    //            // Put the code you want to measure the time of here.
    //        }
    //    }
    
    func testBasicDataTypes() {
        let a = 8
        let b: UInt8 = 240
        print("uint8 min \(UInt8.min), UInt8 max \(UInt8.max), this Unit8 is \(b)")
        
        typealias AudioSample = UInt16
        let sample: AudioSample = 8
        print("AudioSample min \(AudioSample.min), AudioSample max \(AudioSample.max), this AudioSample is \(sample)")
    }
    
    
}
