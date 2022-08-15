//
//  ViewModel.swift
//  iOSTest
//
//  Created by ChenYilong on 10/11/21.
//

import Foundation

class ViewModel {
    var couples: [Couple] = []
    var couplesToRemind: [Couple] = [];
    
    init() {
        let Couple_1 = Couple(
            coupleId: "1",
            anniversary: "2021-8-16T03:07:33.457Z"
        )
        let Couple_2 = Couple(
            coupleId: "2",
            anniversary: "2021-8-29T03:07:33.457Z"
        )
        let Couple_3 = Couple(
            coupleId: "3",
            anniversary: "2017-8-08T03:07:33.457Z"
        )
        let Couple_4 = Couple(
            coupleId: "4",
            anniversary: "2017-8-22T03:07:33.457Z"
        )
        let Couple_5 = Couple(
            coupleId: "5",
            anniversary: "2012-8-01T03:07:33.457Z"
        )
        let Couple_6 = Couple(
            coupleId: "6",
            anniversary: "2012-8-15T03:07:33.457Z"
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
