//
//  HomeView.swift
//  study
//
//  Created by 손찬희 on 2023/05/11.
//

import SwiftUI

struct HomeView: View {
    @State private var isBottomSheetVisible = false
    @StateObject private var stationDetailModel = StationDetailModel()
    
    init() {
        UITabBar.appearance().isTranslucent = false
        let appearance = UITabBarAppearance()
        appearance.shadowColor = .black
        appearance.backgroundColor = UIColor.white
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        VStack {
            TabView{
                StationMapView()
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("First")
                    }
                    .environmentObject(stationDetailModel)
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
            .sheet(isPresented: $stationDetailModel.isBottomSheetShow) {
                BottomSheetView()
                .presentationDetents([.fraction(0.2), .height(200), .medium, .large])
                .environmentObject(stationDetailModel)
            }
        }
    }
}

struct BottomSheetView : View {
    //    @Binding var isShow: Bool
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Bottom Sheet Content")
                    .font(.headline)
                    .padding()
            }
            .frame(height: 200)
            .background(Color.white)
            .cornerRadius(16)
            .padding(.top)
            .animation(.spring())
            .transition(.move(edge: .bottom)) // Bottom Sheet가 아래로 슬라이드되도록 함
            .onTapGesture {
                // Bottom Sheet 클릭 시 사라지도록 함
                //            isShow = false
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
