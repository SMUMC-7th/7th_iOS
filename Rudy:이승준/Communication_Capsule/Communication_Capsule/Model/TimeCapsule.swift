//
//  TimeCapsule.swift
//  Communication_Capsule
//
//  Created by 이승준 on 11/10/24.
//

import Foundation
import Alamofire

// curl -X 'GET' \
//   'https://api-echo.shop/api/timecapsules' \
//   -H 'accept: */*' \
//   -H 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhcHBsZUBnbWFpbC5jb20iLCJyb2xlIjoiIiwiaWF0IjoxNzMxMjA5NzY0LCJleHAiOjE3MzEyMTMzNjR9.voaIfj9yVfUCTQCzvhzmgz7uSIwbulc1WeKZVoeJJSU'

class TimeCapsuleService {
    static let shared = TimeCapsuleService()
    private init() {}
    
    func fetchTimeCapsules(accessToken: String, completion: @escaping (Result<[TimeCapsule], Error>) -> Void) {
        let url = "https://api-echo.shop/api/timecapsules"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(accessToken)"
        ]
        
        AF.request(url, method: .get, headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                if let json = try? JSONDecoder().decode(TimeCapsuleResponse.self, from: data) {
                    completion(.success(json.result))
                    //print(json)
                } else if let token = String(data: data, encoding: .utf8) {
                    print("Received unexpected token: \(token)")
                    // 토큰 갱신 로직 또는 에러 처리
                } else {
                    print("Unexpected response format")
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unexpected response format"])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

struct TimeCapsuleResponse: Codable {
    let isSuccess: Bool
    let code: String  // 이전에 Int였던 것을 String으로 변경
    let message: String
    let result: [TimeCapsule]
}

struct TimeCapsule: Codable {
    let id: Int
    let userId: Int
    let isOpened: Bool
    let title: String
    let tagName: String
    let createdAt: String
    let now: String
    let deadline: String

    enum CodingKeys: String, CodingKey {
        case id, userId, isOpened, title, tagName, createdAt, now, deadline
    }
}

class TimeCapsuleModel {
    
}
