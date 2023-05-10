//
//  Router.swift
//  study
//
//  Created by 손찬희 on 2023/05/07.
//

import Foundation
import SwiftUI

enum JoinViews: Hashable {
    
    case JoinTermView
    case JoinNameView
    case JoinSnsPhoneView
    case JoinIdView
    case JoinPassView
    case StationMapView
    
}


class Router: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func clear() {
        path = .init()
    }
    
    func gotoJoinView(joinViews: JoinViews) {
        path.append(joinViews)
    }
    
}

enum ViewFactory {
    
    @ViewBuilder
    static func viewForDestination(_ destination: JoinViews) -> some View {
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
        
            case .StationMapView:
                StationMapView()
        }
    }
}
