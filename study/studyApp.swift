//
//  studyApp.swift
//  study
//
//  Created by 손찬희 on 2023/04/16.
//

import SwiftUI
import Alamofire

@main
struct studyApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(Router())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        let authManager = APIManager.shared
//        let interceptor = APIInterceptor(apiManager: APIManager)
        // Alamofire 세션 생성
//        let session = Session(interceptor: interceptor)
        return true
    }
}
