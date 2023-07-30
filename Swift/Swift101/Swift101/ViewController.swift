//
//  ViewController.swift
//  Swift101
//
//  Created by chenyilong on 2023/7/28.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        testProtocolExtension()
        arrayFilter()
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
    
    func arrayFilter() {
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
}

