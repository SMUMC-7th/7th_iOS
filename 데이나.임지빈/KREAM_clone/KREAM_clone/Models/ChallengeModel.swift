import Foundation
import UIKit

struct ChallengeModel {
    let image : UIImage
    let id : String
}

extension ChallengeModel {
    static func dummy() -> [ChallengeModel] {
        return [
            ChallengeModel(image: .challengeItem1, id: "@katarinabluu"),
            ChallengeModel(image: .challengeItem2, id: "@imwinter"),
            ChallengeModel(image: .challengeItem3, id: "@thousand_woo")
        ]
    }
}
