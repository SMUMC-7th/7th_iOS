//
//  APIClient.swift
//  UMC_Network
//
//  Created by 이승준 on 11/9/24.
//
import Alamofire
import Foundation

final class APIClient {
    static let shared = APIClient()
    
    private let session: Session
    
    private init() {
        let interceptor = AuthorizationInterceptor(kakaoKey: "8bf9c5374e51cbf47114df3acf60ffd9")
        session = Session(interceptor: interceptor)
    }
    
    public func request<T: Codable>(
        _ url: String,                          // url
        method: HTTPMethod,         // get, put, query 등... 여러가지 있음
        parameters: Parameters? = nil, //
        completion: @escaping (Result<T, Error>) -> Void) {
            session.request(url, method: method, parameters: parameters)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
}
