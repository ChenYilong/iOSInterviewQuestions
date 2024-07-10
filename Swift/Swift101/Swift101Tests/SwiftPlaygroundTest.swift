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
    func welcome() -> String {
        return "welcome!"
    }
    
    func testWelcome() {
        let myWelcome = welcome()
        
        print(myWelcome + "Elon!!")
        
        let customWelcome = welcome(name: "Elon!!!")
        print(customWelcome)
    }
    
    func welcome(name: String) -> String {
        return "Welcome, \(name)"
    }
    
    func error() -> (code: Int, description: String) {
        return (404, "Not found")
    }
    
    func testError() {
        let myError = error()
        print("Error code \(myError.code): \(myError.description)")
    }
    func subtractOne(from number: Int) -> Int {
        return number - 1
    }
    
    func subtractOne(_ number: Int) -> Int {
        return number - 1
    }
    func subtractOne(number: Int) -> Int {
        return number - 1
    }
    
    func testSubtract() {
        print(subtractOne(from: 5))
        print(subtractOne(5))
        print(subtractOne(number: 5))
    }
    
    func addOne(to number: Int = 0) -> Int {
        return number + 1
    }
    
    func testAddone() {
        print(addOne())
        print(addOne(to: 5))
    }
    
    
    enum Product: CaseIterable {
        case laptop
        case desktop
        case phone
        case watch
    }
    enum Suit: String {
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
    }
    
    enum Card {
        case regular(Int, Suit)
        case joker
    }
    
    func testEnum() {
        let product = Product.laptop
        var result: String
        switch product {
        case .laptop:
            result = "laptop"
        case .desktop:
            result = "desktop"
        case .phone:
            result = "phone"
        case .watch:
            result = "watch"
        }
        
        print(result)
        print(Product.allCases)
        
        print(Suit.spades.rawValue)
        
        let card = Card.regular(7, .hearts)
        switch card {
        case .regular(let number, let suit):
            result = "The \(number) of \(suit.rawValue)"
        case .joker:
            result = "Joker"
        }
        
        print(result)
    }
    
    func testBasicDataTypes() {
        let a: UInt8 = 240
        print("uint8 min \(UInt8.min), UInt8 max \(UInt8.max), this Unit8 is \(a)")
        
        typealias AudioSample = UInt16
        let sample: AudioSample = 8
        print("AudioSample min \(AudioSample.min), AudioSample max \(AudioSample.max), this AudioSample is \(sample)")
    }
    
    
    
    struct Point {
        var x = 0
        var y = 0
    }
    
    class Student {
        var name = "name"
        var grade = 1
    }
    
    func testStruct() {
        var p1 = Point()
        var p2 = p1
        p2.x = 4
        p2.y = 5
        
        print("p1 is at (\(p1.x), \(p1.y))")
        print("p2 is at (\(p2.x), \(p2.y))")
    }
    
    func testClass() {
        var s1 = Student()
        var s2 = s1
        s2.name = "Elon"
        s2.grade = 2
        
        print("s1 is \(s1.name) in grade \(s1.grade)")
        print("s2 is \(s2.name) in grade \(s2.grade)")
    }
    
    
    class Person {
        var name: String
        
        init(name: String) {
            self.name = name
        }
    }
    
    struct Company {
        var size: Int
        var manager: Person
        
        mutating func increaseSize() {
            self = Company(size: size + 1, manager: manager)
        }
        
        mutating func increaseSizeV2() {
            size += 1
        }
    }
    
    func testStructAndClass() {
        var companyA = Company(size: 100, manager: Person(name: "Peter"))
        
        var companyB = companyA
        companyA.size = 150  // if a struct is an immutable value type, why we can mutate the size property?
        print(companyA.size) // ? question1
        print(companyB.size) // ? question2
        
        companyA.manager.name = "Bob"
        print(companyA.manager.name) // ? question3
        print(companyB.manager.name) // ? question4
        
        companyA.increaseSize()
        print(companyA.size) // ? question5
        companyA.increaseSizeV2()
        print(companyA.size) // ? question6
    }
    
    struct Cube {
        var sideLength: Double = 1.0 {
            willSet {
                print("will set sideLength to \(newValue) with current sideLength \(sideLength)")
            }
            didSet {
                print("did set sideLength to \(sideLength) from oldValue \(oldValue)")
            }
        }
        var volume: Double {
            return sideLength * sideLength * sideLength
        }
    }
    
    func testStructPropertyObserver() {
        var cube = Cube()
        print("cube volume is \(cube.volume)")
        cube.sideLength = 2.0
        print("cube volume is \(cube.volume)")
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
    
    func testOptional() {
        let str: String? = "123"
        //        let count = str.count //🔴 error: Value of optional type 'String?' must be unwrapped to refer to member 'count' of wrapped base type 'String'
        let count = str!.count
        print(" Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the count is? A：\(count)")
        
        if str != nil {
            let count = str!.count
            print(" Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the count is? A：\(count)")
            
        }
        
        if let actual = str {
            let count = actual.count
            print(" Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the count is? A：\(count)")
        }
        
        let strSecond: String? = nil
        //        let countSecond = strSecond!.count // 🔴Crash:         Thread 1: Fatal error: Unexpectedly found nil while unwrapping an Optional value
        //        print(" Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the countSecond is? A：\(countSecond)")
        
        //try to use optional<wrapped> instead of ?
        
        let strOptionalWrapped: Optional<String> = "123"
        //unsafelyUnwrapped is used to force unwrapping of an optional value, assuming that the optional value is not nil. if it is nil, then the program will crash. like:    🔴 crash when    ```let strOptionalWrapped: Optional<String> = nil```
        let countForStrOptionalWrapped = strOptionalWrapped.unsafelyUnwrapped.count
        print(" Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the countForStrOptionalWrapped is? A：\(countForStrOptionalWrapped)")
        
        if let actualStrOptionalWrapped = strOptionalWrapped {
            let count = actualStrOptionalWrapped.count
            print(" Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the count is? A：\(count)")
        }
    }
    
    func testStr() {
        var emptyStr = ""
        if emptyStr.isEmpty {
            print("emptyStr is empty")
        }
        
        emptyStr = "123"
        emptyStr = String()
        if emptyStr.isEmpty {
            print("emptyStr is empty")
        }
        
        var numbers = """
1
2
3
4
5
"""
        print("🔴 Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the numbers is? A：\(numbers)")
        
        numbers = """
        
1
2
3
4
5
"""
        print("🔴 Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the numbers is? A：\(numbers)")
        
        
        numbers = """
        
1\
2\
3
4
5
"""
        print("🔴 Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the numbers is? A：\(numbers)")
        
        numbers = """
        1
        2
            3
        4
        5
        """
        print("🔴 Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the numbers is? A：\(numbers)")
        
        
        var strMutiLine = "\n1\n2\n3"
        print("🔴 Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the strMutiLine is? A：\(strMutiLine)")
        
        strMutiLine = #"\n1\n2\n3"#
        print("🔴 Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the strMutiLine is? A：\(strMutiLine)")
        strMutiLine = ##"\n1\"#n2\n3"##
        
        print("🔴 Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the strMutiLine is? A：\(strMutiLine)")
        strMutiLine = ##"\n1\"#n2\##n3"##
        print("🔴 Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the strMutiLine is? A：\(strMutiLine)")
        strMutiLine = ##"\n1\"#n2\#n3"##
        print("🔴 Swift Class Name：\((#file as NSString).lastPathComponent) func Name：\(#function)（at \(#line) line）, Q: what the strMutiLine is? A：\(strMutiLine)")
    }
    
    
    struct BankAccount {
        var balance: Double
        init(balance: Double) {
            self.balance = balance
        }
        
        mutating func deposit(amount: Double) {
            balance += amount
        }
        
        mutating func withdraw(amount: Double) -> Double {
            let amount = min(balance, amount)
            balance -= amount
            return amount
        }
    }
    
    func testStructMutatingWithBankAccount() {
        var account = BankAccount(balance: 100)
        account.deposit(amount: 50)
        print("account balance is \(account.balance)")
        print("account balance is \(account.withdraw(amount: 100))")
        print("account balance is \(account.withdraw(amount: 1000))")
    }
    
    enum LightSwitch {
        case red, green, yellow
        
        mutating func next() {
            switch self {
            case .red:
                self = .green
            case .green:
                self = .yellow
            case .yellow:
                self = .red
            }
        }
    }
    func testMethodWithLightSwitch() {
        var lightSwitch = LightSwitch.red
        lightSwitch.next()
        print("lightSwitch is \(lightSwitch)")
        lightSwitch.next()
        print("lightSwitch is \(lightSwitch)")
        lightSwitch.next()
        print("lightSwitch is \(lightSwitch)")
        lightSwitch.next()
        print("lightSwitch is \(lightSwitch)")
    }
    
    
    class Enemy {
        var health = 100
        var speed = 1
        func makeAttackNoise() {
            print("Enemy attack")
        }
        
        var desription: String {
            return "Enemy with health \(health) and speed \(speed)"
        }
    }
    
    class Lion: Enemy {
        func scratch() {
            print("Lion scratch")
        }
        
        override func makeAttackNoise() {
            print("Lion attack")
            super.makeAttackNoise()
        }
        override var desription: String {
            return "Lion with health \(health) and speed \(speed)"
        }
    }
    
    
    func testInheritance() {
        let lion = Lion()
        print(lion.desription)
        lion.makeAttackNoise()
        lion.scratch()
        print(lion.desription)
    }
    
    struct Shoe {
        let brand: String
        let size: Int
        let color: String
        init(brand: String) {
            self.brand = brand
            size = 10
            color = "Red"
        }
//        init(brand: String, size: Int, color: String) {
//            self.brand = brand
//            self.size = size
//            self.color = color
//        }
    }
    
    func testInitializeWithShoe() {
//        let shoe = Shoe(brand: "Nike", size: 10, color: "Red")
//        print("shoe is \(shoe)")
        
        let shoe = Shoe(brand: "Nike")
        print("shoe is \(shoe)")

    }
    
    class Products {
        let name: String
        init(name: String) {
            self.name = name
        }
    }
    
    class Bottle: Products {
        let size: Double
        
        init(name: String, size: Double) {
            self.size = size
            super.init(name: name)
        }
        
        convenience override init(name: String) {
            self.init(name: name, size: 500)
        }
    }
    
    func testInitializeWithProduct() {
        
        let product = Products(name: "Water")
        print("product is \(product)")
        let bottle = Bottle(name: "Water", size: 500)
        print("bottle is \(bottle)")
        
        let bottle2 = Bottle(name: "Water")
        print("bottle2 is \(bottle2)")
    }
}
