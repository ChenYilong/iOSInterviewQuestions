//
//  Swift101Tests.swift
//  Swift101Tests
//
//  Created by chenyilong on 2023/7/28.
//

import XCTest
@testable import Swift101
class MyOperation: Operation, @unchecked Sendable {
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
    
    /// testArray
    func testArray() {
        let names: [String] = ["Elon", "world", "boy", "man", "brother"]
        for name in names {
            print("hi there, \(name)")
            /*!Output:
             * hi there, Elon
             hi there, world
             hi there, boy
             hi there, man
             hi there, brother
             */
        }
        
        
        struct people {
            let name : String
            let hobby : String?
        }
        
        let peopleArray: [people] = [people(name: "Elon", hobby: "swift"), people(name: "world", hobby: "coding"), people(name: "boy", hobby: nil)]
        
        for person in peopleArray {
            if let hobby = person.hobby {
                print("\(person.name) loves to \(hobby)")
            } else  {
                print("\(person.name) has no hobby")
            }
            /*!Output:
             * Elon loves to swift
             world loves to coding
             boy has no hobby
             */
        }
        for person in peopleArray {
            guard let hobby = person.hobby else {
                print("\(person.name) has no hobby")
                continue
            }
            print("\(person.name) loves to \(hobby)")
            /*!Output:
             * Elon loves to swift
             world loves to coding
             boy has no hobby
             */
        }
        
        let result: Int = 112
        for divisor in 1...10 {
            let remainder = result % divisor
            let quotient = result / divisor
            if remainder == 0 {
                print("\(result) = \(divisor) * \(quotient)")
            } else {
                print("\(result) = \(divisor) * \(quotient) + \(remainder)")
            }
            /*!
             result = divisor × quotient + remainder
             result = 除数 × 商 + 余数
             
             * 112 = 1 * 112
             112 = 2 * 56
             112 = 3 * 37 + 1
             112 = 4 * 28
             112 = 5 * 22 + 2
             112 = 6 * 18 + 4
             112 = 7 * 16
             112 = 8 * 14
             112 = 9 * 12 + 4
             112 = 10 * 11 + 2
             */
            
        }
        
        let absences = [0, 2, 0, 4, 0, 3, 1, 0]
        for (index, value) in absences.enumerated() {
            print("The number \(index + 1) has \(value) absences")
        }
        
    }
    
    
    /// testSet
    func testSet() {
        let a: Set<Int> = [1, 2, 3]
        let b: Set<Int> = [2, 3, 4]
        //the union of [3, 1, 2] with [4, 3, 2] is [2, 3, 1, 4]
        print("the union of \(a) with \(b) is \(a.union(b))")
        //the intersection of [2, 1, 3] with [3, 4, 2] is [2, 3]
        
        print("the intersection of \(a) with \(b) is \(a.intersection(b))")
        //        the diff of [2, 1, 3] with [3, 4, 2] is [1]
        
        print("the diff of \(a) with \(b) is \(a.subtracting(b))")
        //the diff of [3, 4, 2] with [2, 1, 3] is [4]
        
        print("the diff of \(b) with \(a) is \(b.subtracting(a))")
        
    }
    func testDict() {
        var foodCalories:[String: Int] = ["banana":105, "pizza": 285]
        if let calories = foodCalories["cake"] {
            print(calories)
        } else {
            foodCalories["cake"] = 500
        }
        print(foodCalories)
        let calories: Int = foodCalories["cabbage", default: 0]
        print(calories)
        
        let calories2: Int = foodCalories["cake", default: 0]
        print(calories2)
        for (key, value) in foodCalories {
            print("the number of calories in \(key) is \(value)")
        }
    }
    
    func testControlFlow() {
        
        let minuteInterval = 10
        var minutes = 60
        //        while minutes < 60 {
        //            print("\(minutes) minutes have passed since 12:00 PM")
        //            minutes += minuteInterval
        //        }
        
        
        for tickMark in stride(from: 0, through: minutes, by: minuteInterval)  {
            print(tickMark)
        }
    }
    
    /*!
     * https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Range-Operators
     */
    func testRangeOperators() {
        //Switch
        func positionDescription( point: (x: Int, y: Int)) -> String {
            switch point {
            case (0,0):
                "\(point) is at the origin"
            case (_,0):
                "\(point) is on the x-axis"
            case (0,_):
                "\(point) is on the y-axis"
            case (0...,0...):"\(point) is in the first quadrant"
            case (...0,0...):
                "\(point) is in the second quadrant"
            case (...0,...0):
                "\(point) is in the third quadrant"
            case (0...,...0):
                "\(point) is in the fourth quadrant"
            default:
                "\(point) is at an unknown position"
            }
        }
        /*!
        * (x: 2, y: 2) is in the first quadrant
       (x: -2, y: 2) is in the second quadrant
       (x: 2, y: -2) is in the fourth quadrant
       (x: -2, y: -2) is in the third quadrant
       (x: 0, y: 0) is at the origin
        */
        print(positionDescription(point: (2,2)))
        
        print(positionDescription(point: (-2,2)))
        
        print(positionDescription(point: (2,-2)))
        
        print(positionDescription(point: (-2,-2)))
        
        print(positionDescription(point: (0,0)))
        /*!
         * play with Swift case statements and tuples. It looks like one of the cooler features of the language.
         A value-binding tuple pattern with a where clause inside a switch case is a valid construct in Swift programming language.
         * threshold 阈值
         */
        func onSineOrCosine(point:(x: Double, y: Double ), threshold: Double = 0.01) -> String {
            let threshold = 0.001
            switch point {
            case let (x, y) where (y <= sin(x)+threshold || y >= sin(x)-threshold) || (y <= cos(x)+threshold || y >= cos(x)-threshold):
                return "\(point) is on sine, cosine or both"
            default:
                return "\(point) is not on sine or cosine"
            }
        }

        /*!(x: 5.0, y: -0.9589242746631385) is on sine, cosine or both
         */
        print(onSineOrCosine(point: (5, sin(5)), threshold: 0.1))
        
        func sum(numbers: Double...) -> Double {
            var sum = 0.0
            for number in numbers {
                sum += number
            }
            return sum
        }
        print(sum(numbers: 1,2,3,4,5))
        print(sum())
        /*!
         inout keyword.
         *
         NSValue *frameObj = [NSValue value:&frame withObjCType:@encode(CGRect)];
         result = [NSJSONSerialization JSONObjectWithData:dataToBeParsed options:kNilOptions error:&error];
         #define MyKVOContext(A) static void * const A = (void*)&A;
         */
        func swap(a: inout Int, b: inout Int) {
            let temp = a
            a = b
            b = temp
        }
        var num1 = 1
        var num2 = 2
        print("num1 \(num1) num2 is \(num2)")
        swap(a: &num1, b: &num2)
        print("num1 \(num1) num2 is \(num2)")

        



    }
    func testClosure() {
        
        func sumF(_ numbers: Double..., fn: (Double) -> Double) -> Double {
            var sum: Double = 0
            for number in numbers {
                sum += fn(number)
            }
            return sum
        }
        
        func square(_ x: Double) -> Double {
            return x * x
        }
        //squre(1)+squre(2)+squre(3)
        print(sumF(1,2,3, fn: square))
        
        //floor(1)+floor(2)+floor(3)
        print(sumF(1,2,3, fn: floor))
        
        
        print(sumF(1,2,3, fn: +))
        print(sumF(1,2,3, fn: -))
//        print(sumF(1,2,3, fn: *))
    }
    
    //arithmetic
    //compound operator 复合运算
    //an= a1+a2+a3+..+an , a2=a1+d
    func sumarithmetic(a1: Double, d: Double, n: Int) -> Double? {
        var sum: Double = 0
        if n  <= 0 {
            return nil
            //            return 0
        }
        for i in 1...n {
            sum += arithmeticProgression(a1: a1, d: d, n:i)
        }
        return sum
    }
    
    func arithmeticProgression(a1: Double, d: Double, n: Int) -> Double {
        return a1 + (Double(n) + d)
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
    
    func testLazyFilter() {
        let numbers = [1, 2, 3, 4, 5]
        let modifiedNumbers = numbers
            .lazy
            .filter { $0 % 2 == 0}
            .map { $0 * 2 }
        print(modifiedNumbers[0])
    }
    
    func testLazyFilter2() {
        let numbers = [1, 2, 3, 4, 5]
        let modifiedNumbers = numbers
            .lazy
            .map { $0 * 2 }
            .filter { $0 % 2 == 0}
        print(modifiedNumbers.first ?? -1)
    }
    
    func testLazyFilter4() {
        let numbers = [1, 2, 3, 4, 5]
        let modifiedNumbers = numbers
            .lazy
            .filter { $0 % 2 == 0}
            .map { $0 * 2 }
        
        if let firstNumber = modifiedNumbers.first {
            print(firstNumber)
        } else {
            print("No even numbers found")
        }
    }
    
    struct Person {
        var name: String
        var age: Int
    }
    
    func testLazyFilter3() {
        let persons = [
            Person(name: "Alice", age: 17),
            Person(name: "Bob", age: 18),
            Person(name: "Charlie", age: 20),
        ]
        let result = persons.lazy.filter { $0.age >= 18 }.map { $0.name }
        print(Array(result))
    }
    
    
    struct CYLSequence<Element>: Sequence {
        struct Iterator: IteratorProtocol {
            let _next: () -> Element?
            
            func next() -> Element? {
                return _next()
            }
        }
        
        let _makeIterator: () -> Iterator
        
        func makeIterator() -> Iterator {
            return _makeIterator()
        }
        
        init<Seq: Sequence>(_ seq: Seq) where Seq.Element == Element {
            var iterator = seq.makeIterator()
            _makeIterator = {
                return Iterator(_next: { iterator.next() })
            }
        }
        
        
    }
    
    func printList(_ seq: CYLSequence<Int>) {
        seq.forEach({ print("\($0)") })
    }
    
    func testTypeErasure()  {
        let array = [1, 2, 3, 4, 5, 6]
        // 1, 2, 3, 5, 5
        printList(CYLSequence(array))
        // 2, 3, 4
        printList(CYLSequence(array[1..<4]))
        
    }
    
    func testLazyCapture() {
        var capturedValue: Int = 0
        
        let valueCaptureListClosure = {
            print(capturedValue)
        }
        
        capturedValue = 1
        
        valueCaptureListClosure()  // 打印1 说明闭包看到的是当前的 capturedValue 的值
    }
    
    func testEagerCaptureAndCaptureListValueType() {
        var capturedValue: Int = 0
        let valueCaptureListClosure = { [capturedValue] in
            print(capturedValue)
        }
        
        capturedValue = 1
        
        valueCaptureListClosure()  // 打印0，说明闭包看到的是捕获时的 capturedValue 的值，而不是当前的值
    }
}

