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
        
        for couple in viewModel.couples {
            if couple.shouldAnniversaryToRemind() {
                viewModel.couplesToRemind.append(couple)
            }
        }
        print(viewModel.couplesToRemind)
    }
    
    
}

