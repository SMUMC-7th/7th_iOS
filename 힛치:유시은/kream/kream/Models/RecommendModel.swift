//
//  RecommendModel.swift
//  kream
//
//  Created by 유시은 on 10/26/24.
//

import UIKit

struct RecommendModel {
    let image: UIImage
    let name: String
}

// 더미 데이터를 만들기 위한 RecommendModel의 extension
extension RecommendModel {
    static func dummy() -> [RecommendModel] {
        return [
            RecommendModel(image: .recommend1, name: "크림 드로우"),
            RecommendModel(image: .recommend2, name: "실시간 차트"),
            RecommendModel(image: .recommend3, name: "남성 추천"),
            RecommendModel(image: .recommend4, name: "여성 추천"),
            RecommendModel(image: .recommend5, name: "색다른 추천"),
            RecommendModel(image: .recommend6, name: "정가 아래"),
            RecommendModel(image: .recommend7, name: "윤세 24AW"),
            RecommendModel(image: .recommend8, name: "올해의 베스트"),
            RecommendModel(image: .recommend9, name: "10월 베네핏"),
            RecommendModel(image: .recommend10, name: "아크네 선물")
        ]
    }
}
