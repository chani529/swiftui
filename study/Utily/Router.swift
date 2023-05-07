//
//  Router.swift
//  study
//
//  Created by 손찬희 on 2023/05/07.
//

import Foundation
import SwiftUI

enum Views: Hashable {
    
    case JoinTermView
    case JoinNameView
    case JoinSnsPhoneView
    case JoinIdView
    case JoinPassView
    
}


class Router: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func clear() {
        path = .init()
    }
    
    func gotoView(views: Views) {
        path.append(views)
    }
    
}

enum ViewFactory {
    
    @ViewBuilder
    static func viewForDestination(_ destination: Views) -> some View {
        switch destination {
            
            case .JoinTermView:
                JoinTermView()
                
            case .JoinNameView:
                JoinNameView()
                
            case .JoinSnsPhoneView:
                JoinSnsPhoneView()

            case .JoinIdView:
                JoinIdView()

            case .JoinPassView:
                JoinPassView()
        }
    }
}
