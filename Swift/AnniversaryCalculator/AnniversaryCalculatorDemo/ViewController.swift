//
//  ViewController.swift
//  AnniversaryCalculatorDemo
//
//  Created by chenyilong on 2022/8/15.
//

import UIKit

class ViewController: UIViewController {
    let viewModel: ViewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for couple in self.viewModel.couples {
            if couple.shouldAnniversaryToRemind() {
                self.viewModel.couplesToRemind.append(couple)
            }
        }
        print("shouldAnniversaryToRemind: " , self.viewModel.couplesToRemind)
    }


}

