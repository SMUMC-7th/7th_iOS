import Foundation
import UIKit

struct HomeModel {
    let image : UIImage
    let name : String
}

extension HomeModel {
    static func dummy() -> [HomeModel] {
        return [
            HomeModel(image: .homeItem1, name: "크림 드로우"),
            HomeModel(image: .homeItem2, name: "실시간 차트"),
            HomeModel(image: .homeItem3, name: "남성 추천"),
            HomeModel(image: .homeItem4, name: "여성 추천"),
            HomeModel(image: .homeItem5, name: "색다른 추천"),
            HomeModel(image: .homeItem6, name: "정가 아래"),
            HomeModel(image: .homeItem7, name: "윤세 24AW"),
            HomeModel(image: .homeItem8, name: "올해의 베스트"),
            HomeModel(image: .homeItem9, name: "10월 베네핏"),
            HomeModel(image: .homeItem10, name: "아크네 선물")
        ]
    }
}
