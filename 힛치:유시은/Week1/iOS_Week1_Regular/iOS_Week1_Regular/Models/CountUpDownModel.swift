//
//  CountUpDownModel.swift
//  iOS_Week1_Regular
//
//  Created by 유시은 on 9/27/24.
//

import Foundation

struct CountUpDownModel {
    var count: Int = 0
    
    mutating func increaseCount() {
        self.count += 1
    }
    
    mutating func decreaseCount() {
        self.count -= 1
    }
}

