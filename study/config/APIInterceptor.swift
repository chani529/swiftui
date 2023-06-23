//
//  ApiInterceptor.swift
//  study
//
//  Created by 손찬희 on 2023/05/29.
//

import Foundation
import Alamofire

class APIInterceptor: RequestInterceptor {
    private let baseURL: String
    private let apiManager: APIManager
    
    init(apiManager: APIManager) {
        // 기본 URL 세팅
        self.baseURL = Constants.baseURL
        self.apiManager = apiManager
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var adaptedRequest = urlRequest
        adaptedRequest.url = URL(string: baseURL)?.appendingPathComponent(urlRequest.url?.path ?? "")
        
        if let token = apiManager.getToken() {
            adaptedRequest.headers.add(.authorization(bearerToken: token))
        }
        
        completion(.success(adaptedRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
}
