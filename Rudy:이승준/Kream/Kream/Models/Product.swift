//
//  Product.swift
//  Kream
//
//  Created by 이승준 on 10/6/24.
//

import Foundation
import UIKit

struct Product {
    let name: String
    let desription: String
    let image: UIImage?
    var traded: String = "0"
    let price: Int
    var bookmarked: Bool
}

final class SavedProducts {
    static let data: [Product] = [
        Product(name: "손오공이 잃어버린 머리띠 반쪽", desription: """
                손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!
                """,
                image: UIImage(named: "Ring01"),
                price: 942192000, bookmarked: true),
        Product(name: "골드 반지", desription: """
                결혼 준비하는 당신?!
                약혼녀에게 이 반지를 선물하는 건 어때요?!
                """,
                image: UIImage(named: "Ring02"),
                price: 12000, bookmarked: true),
        Product(name: "하얀 신발", desription: """
                짝퉁 나이키 신발!
                정말 푹신푹신해서 걷다가 졸려서 넘어지...
                """,
                image: UIImage(named: "Shoes01"),
                price: 90000, bookmarked: true),
        Product(name: "에베레스트 다이아 반지", desription: """
                에베레스트 올라가서 다이아 구하고 만든
                반지,,! 과연 이것을 누가 사갈것인가??
                """,
                image: UIImage(named: "Ring03"),
                price: 1292999000, bookmarked: true),
        Product(name: "아디다스다 신발", desription: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~",
                image: UIImage(named: "Shoes02"),
                price: 120000, bookmarked: true),
        Product(name: "황제 잠옷", desription: """
                "어느 나라의 황제가 입었다던 잠옷
                크리스마스 트리같이 보이는 디자인!
                """,
                image: UIImage(named: "Pajama01"),
                price: 120000000, bookmarked: true),
        Product(name: "고장난 기타", desription: """
                블라블라블라블라
                블라블라블라블라블라
                """,
                image: UIImage(named: "Guitar01"),
                price: 120000, bookmarked: true),Product(name: "아디다스다 신발", desription: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~",
                image: UIImage(named: "Shoes02"),
                price: 120000, bookmarked: true),
        Product(name: "황제 잠옷", desription: """
                "어느 나라의 황제가 입었다던 잠옷
                크리스마스 트리같이 보이는 디자인!
                """,
                image: UIImage(named: "Pajama01"),
                price: 120000000, bookmarked: true),
        Product(name: "고장난 기타", desription: """
                블라블라블라블라
                블라블라블라블라블라
                """,
                image: UIImage(named: "Guitar01"),
                price: 120000, bookmarked: true),Product(name: "아디다스다 신발", desription: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~",
                image: UIImage(named: "Shoes02"),
                price: 120000, bookmarked: true),
        Product(name: "황제 잠옷", desription: """
                "어느 나라의 황제가 입었다던 잠옷
                크리스마스 트리같이 보이는 디자인!
                """,
                image: UIImage(named: "Pajama01"),
                price: 120000000, bookmarked: true),
        Product(name: "고장난 기타", desription: """
                블라블라블라블라
                블라블라블라블라블라
                """,
                image: UIImage(named: "Guitar01"),
                price: 120000, bookmarked: true),
    ]
    static let just: [Product] = [
        Product(name: "청키라이너 뉴욕양키스",
                desription: "MLB",
                image: UIImage(named: "청키라이너 뉴욕양키스"),
                traded: "12.8만",
                price: 139000, bookmarked: false),
        Product(name: "Jordan 1 Retro High OG Yellow Ochre",
                desription: "Jordan",
                image: UIImage(named: "Jordan 1 Retro High OG Yellow Ochre"),
                traded: "15.6만",
                price: 228000, bookmarked: true),
        Product(name: "Human Made x Kaws Varsity Jacket #1 Black",
                desription: "Human Made",
                image: UIImage(named: "Human Made x Kaws Varsity Jacket #1 Black"),
                traded: "15.6만",
                price: 2000000, bookmarked: true),
    ]
}

