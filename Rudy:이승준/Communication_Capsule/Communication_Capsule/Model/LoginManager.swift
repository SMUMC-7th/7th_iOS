//
//  LoginManager.swift
//  Communication_Capsule
//
//  Created by 이승준 on 11/10/24.
//

import Foundation
import Alamofire

struct LoginResponse: Codable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: TokenResult
}

struct TokenResult: Codable {
    let accessToken: String
    let refreshToken: String
}

class TokenManager {
    static let shared = TokenManager()
    private init() {}
    
    var tokenResult: TokenResult?
    
    func saveTokens(_ result: TokenResult) {
        self.tokenResult = result
        // 필요하다면 여기서 KeyChain에 저장할 수 있습니다.
    }
    
    func getAccessToken() -> String? {
        return tokenResult?.accessToken
    }
    
    func getRefreshToken() -> String? {
        return tokenResult?.refreshToken
    }
}

class LoginManager {
    static let shared = LoginManager()
    private init() {}
    
    func login(email: String, password: String, completion: @escaping (Result<TokenResult, Error>) -> Void) {
        let parameters: [String: Any] = ["email": email, "password": password]
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request("https://api-echo.shop/api/users/login",
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                case .success(let loginResponse):
                    if loginResponse.isSuccess {
                        completion(.success(loginResponse.result))
                    } else {
                        let error = NSError(domain: "", code: Int(loginResponse.code) ?? 0, userInfo: [NSLocalizedDescriptionKey: loginResponse.message])
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
