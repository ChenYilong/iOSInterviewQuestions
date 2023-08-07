//
//  Swift101Tests.swift
//  Swift101Tests
//
//  Created by chenyilong on 2023/7/28.
//

import XCTest
@testable import Swift101
class MyOperation: Operation {
    private var _executing = false {
        willSet {
            willChangeValue(forKey: "isExecuting")
        }
        didSet {
            didChangeValue(forKey: "isExecuting")
        }
    }

    override var isExecuting: Bool {
        return _executing
    }

    private var _finished = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }
        didSet {
            didChangeValue(forKey: "isFinished")
        }
    }

    override var isFinished: Bool {
        return _finished
    }

    override func start() {
        if isCancelled {
            _finished = true
            return
        }
        _executing = true
        main()
    }

    override func main() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            print("MyOperation async done")

            self._executing = false
            self._finished = true
        }
    }
}



final class Swift101Tests: XCTestCase {

    override func setUpWithError() throws {
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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    fileprivate func testProtocolExtension() {
        // Do any additional setup after loading the view.
        let aType: ClassIdenfifiable.Type = BaseCell.self
        print("aType.reuseIdentifier is ", aType.reuseIdentifier)
        print("aType.reuseIdentifier2 is ", aType.reuseIdentifier2)
        
        //       ClassIdenfifiable is Existential type
        //
        let cell: ClassIdenfifiable = BaseCell()
        print("BaseCell.reuseIdentifier is ", BaseCell.reuseIdentifier)
        print("BaseCell.reuseIdentifier2 is ", BaseCell.reuseIdentifier2)
    }
    
    func testArrayFilter() {
        let nestedArray = [[1, 2, 3], [4, 5, 6]]
        let flattenedArray = nestedArray.flatMap { $0 }
        print("flatMap ", flattenedArray) // Output: [1, 2, 3, 4, 5, 6]

        
        let stringNumbers = ["1", "2", "three", "4"]
        let mappedNumbers = stringNumbers.compactMap { Int($0) }
        print("compactMap ", mappedNumbers) // Output: [1, 2, 4]

        let sampleNumbers = [1, 2, 3, 4]
        let squaredNumbers = sampleNumbers.map { $0 * $0 }
        print("compactMap ", squaredNumbers) // Output: [1, 4, 9, 16]

    }
    
    func testQueue() {
        let op0 = MyOperation()
        let op1 = MyOperation()

        op0.addDependency(op1)

        let queue = OperationQueue()
        queue.addOperation(op0)
        queue.addOperation(op1)

        queue.waitUntilAllOperationsAreFinished()

        print("after waitUntilAllOperationsAreFinished")
        
        queue.addBarrierBlock {
            print("barrier block")
        }
    }
    
    func testTypealiasWithInit() {
        typealias Thing = [String: Any]
        var stuff: Thing = [:] // Initialize with an empty dictionary
        print("testTypealiasWithInit", type(of: stuff))

    }
    
    
    func testTypealiasNoInit() {
        typealias Thing = [String: Any]
        var stuff: Thing
        print("testTypealiasNoInit", type(of: stuff))

    }
}
