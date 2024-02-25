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
    
    func testTuple() {
        let error = (1, "No Autherity")
        print("error is \(error)")
        print("error code is \(error.0)")
        print("error msg is \(error.1)")
        
        let notExistError = (errorCode: 1, errorMessage: "not exist")
        print("error is \(notExistError)")
        print("error code is \(notExistError.errorCode)")
        print("error msg is \(notExistError.errorMessage)")
        
        var codeEditableError = (errorCode: 2, errorMessage: "not exist")
        codeEditableError.errorCode = 404
        print("error is \(codeEditableError)")
        print("error code is \(codeEditableError.errorCode)")
        print("error msg is \(codeEditableError.errorMessage)")
        
        
        var msgEditableError: (errorCode: Int, errorMessage: Any) = (errorCode: 2, errorMessage: "not exist")
        msgEditableError.errorMessage = 404
        print("error is \(msgEditableError)")
        print("error code is \(msgEditableError.errorCode)")
        print("error msg is \(msgEditableError.errorMessage)")
        
        func writeFile(content: String) -> (errorCode: Int, errorMsg: String) {
            return (1, "not exist")
        }
        
        let funcReturnError = writeFile(content: "onlyForTest")

        print("🔴 Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the funcReturnError is? A：\(funcReturnError)")

        
    }
    
}
