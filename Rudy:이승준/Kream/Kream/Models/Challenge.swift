//
//  Challenge.swift
//  Kream
//
//  Created by 이승준 on 11/4/24.
//

import UIKit

struct Challenge {
    let userid: String
    let userPhoto: UIImage
}

class ChallengeModel {
    static let data: [Challenge] = [
        Challenge(userid: "@katarinabluu", userPhoto: .karina),
        Challenge(userid: "@imwinter", userPhoto: .winter),
        Challenge(userid: "@thousand_wooo", userPhoto: UIImage(named: "천우희")!),
    ]
}

