//
//  StationViewModel.swift
//  study
//
//  Created by 손찬희 on 2023/05/30.
//

import Foundation
import Alamofire

class StationViewModel: ObservableObject {

    func fetchStations() {
        print("test")
        AF.request("http://nzeus.zentropy.co.kr/api/station")
            .validate(statusCode: 200..<300) // 응답 상태 코드 유효성 검사
            .responseData { response in
                switch response.result {
                case .success(let data):
                    print("Stations fetched successfully:")
                  
                    if let string = String(data: data, encoding: .utf8) {
                        print(string)
                    } else {
                        print("데이터를 문자열로 변환할 수 없습니다.")
                    }

                case .failure(let error):
                    print("Failed to fetch stations: \(error)")
                }
            }
    }
}
