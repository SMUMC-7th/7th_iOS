import Foundation
import UIKit

struct JustDroppedModel {
    let image : UIImage
    let brand : String
    let name : String
    let price : String
    let pricedescription : String
}

extension JustDroppedModel {
    static func dummy() -> [JustDroppedModel] {
        return [
            JustDroppedModel(image: .justDroppedItem1, brand: "MLB", name: "청키라이너 뉴욕양키스", price: "139,000원", pricedescription: "즉시 구매가"),
            JustDroppedModel(image: .justDroppedItem2, brand: "Jordan", name: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000원", pricedescription: "즉시 구매가"),
            JustDroppedModel(image: .justDroppedItem3, brand: "Human Made", name: "Human Made x Kaws Varsity Jacket #1 Black", price: "2,000,000원", pricedescription: "즉시 구매가")
        ]
    }
}
