//
//  SearchModel.swift
//  UMC_Network
//
//  Created by 이승준 on 11/9/24.
//

import Foundation

struct SearchModel: Codable {
    let documents: [DetailDocument]
}

struct DetailDocument: Codable {
    let contestText: String
    let date: String
    let titleText: String
    let urlText: String
    
    enum CodingKeys: String, CodingKey {
        case contestText = "contents"
        case date = "datetime"
        case titleText = "title"
        case urlText = "url"
    }
}

// JSON
//{
//    "documents": [
//        {
//            "contents": String,
//            "datetime": String,
//            "title": String,
//            "url": String
//        },
//        {
//            "contents": String,
//            "datetime": String,
//            "title": String,
//            "url": String,
//        }
//    ],
// 아래 내용은 안씀
//    "meta": {
//        "is_end": Bool,
//        "pageable_count": Int,
//        "total_count": Int
//    }
//}
