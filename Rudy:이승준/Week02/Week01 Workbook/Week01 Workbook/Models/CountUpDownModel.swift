//
//  CountUpDownModel.swift
//  Week01 Workbook
//
//  Created by 이승준 on 9/23/24.
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
