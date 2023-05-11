//
//  HomeView.swift
//  study
//
//  Created by 손찬희 on 2023/05/11.
//

import SwiftUI

struct HomeView: View {
    init() {
        UITabBar.appearance().isTranslucent = false
      
    }
    var body: some View {
        TabView{
            StationMapView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
        .tabViewStyle(DefaultTabViewStyle())
//        .shadow(radius: 10, x: 0, y: -10)
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
