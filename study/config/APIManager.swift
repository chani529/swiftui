//
//  AuthManager.swift
//  study
//
//  Created by 손찬희 on 2023/05/29.
//

import Foundation
import Alamofire

class APIManager {
    static let shared = APIManager()
    
    private var token: String?
    
    private init() {}
    
    func setToken(_ token: String?) {
        self.token = token
    }
    
    func getToken() -> String? {
        return token
    }
    func getRequest<T: Decodable>(endpoint: String, stringURL : String? = nil, parameters: Parameters? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        
        let interceptor = APIInterceptor(apiManager: APIManager.shared)
        let session = Session(interceptor: interceptor)
        
        var urlRequest: URLRequest
        
        if let stringURL = stringURL, let url = URL(string: stringURL) {
            urlRequest = URLRequest(url: url.appendingPathComponent(endpoint))
        } else {
            urlRequest = URLRequest(url: URL(string: endpoint)!)
        }
        
        urlRequest.method = .get
        
        if let parameters = parameters {
            var urlComponents = URLComponents()
            urlComponents.queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
            urlRequest.url = urlComponents.url
        }
        
        
        session.request(urlRequest).responseDecodable(of: T.self) { response in
              switch response.result {
              case .success(let value):
                  completion(.success(value))
              case .failure(let error):
                  completion(.failure(error))
              }
          }
    }






}
