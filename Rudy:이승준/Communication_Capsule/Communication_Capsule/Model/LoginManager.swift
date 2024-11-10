//
//  LoginManager.swift
//  Communication_Capsule
//
//  Created by 이승준 on 11/10/24.
//

import Foundation
import Alamofire

struct LoginResponse: Codable { // Login이 잘 이루어지면 (200) 받는 정보
    let accessToken: String
    let refreshToken: String
}

class TokenManager { // 토큰 관리자
    static let shared = TokenManager()
    private init() {}
    
    // 로그인 이후 토큰을 저장
    var loginResponse: LoginResponse?
    
    func saveTokens(_ response: LoginResponse) {
        self.loginResponse = response
        // 필요하다면 여기서 KeyChain에 저장할 수 있습니다.
    }
}

class LoginManager {
    static let shared = LoginManager()
    private init() {}
    
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        let parameters: [String: Any] = ["email": email, "password": password]
        
        let headers: HTTPHeaders = [
            "accept": "*/*",
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
                    // 토큰 저장
                    TokenManager.shared.saveTokens(loginResponse)
                    completion(.success(loginResponse))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
