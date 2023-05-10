//
//  StataionMapView.swift
//  study
//
//  Created by 손찬희 on 2023/05/08.
//

import SwiftUI
import NMapsMap

struct StationMapView: View {
    @State var coord: (Double, Double) = (126.9783881, 37.5666102)
//    @State var coord: (Double, Double) = (37.5666102, 126.9783881)
    var body: some View {
        TabView{
        ZStack {
            VStack {
                HStack{
                    Button(action: {
                        // 버튼이 눌렸을 때 실행할 액션
                    }) {
                        Text("O")
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                            .frame( height: 5)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(45)
                            .shadow(radius: 5)
                    }
                    Button(action: {
                        // 버튼이 눌렸을 때 실행할 액션
                    }) {
                        Text("버튼 텍스트")
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width * 0.6, height: 5)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(radius: 5)
                    }
                }
              
                Spacer()
                HStack{
                    Spacer()
                    VStack(alignment: .trailing){
                   
                        Button(action: {
                            // 버튼이 눌렸을 때 실행할 액션
                        }) {
                            Text("O")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .frame( height: 5)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(45)
                                .shadow(radius: 5)
                        }
                        
                    }
                    .padding(30)
                }
                
            }
            .zIndex(10)
            
            UIMapView(coord: coord)
                .edgesIgnoringSafeArea(.vertical)
                
        }// zstack
        }// TabView
    }
}

struct UIMapView: UIViewRepresentable {
    var coord: (Double, Double)
    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
         view.showZoomControls = true
         view.mapView.positionMode = .normal
         view.mapView.zoomLevel = 17

         let marker = NMFMarker(position: NMGLatLng(lat: 37.5666102, lng: 126.9783881))
         marker.iconImage = NMFOverlayImage(name: "img_marker")
         marker.mapView = view.mapView
        return view
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        let coord = NMGLatLng(lat: coord.1, lng: coord.0)
        let cameraUpdate = NMFCameraUpdate(scrollTo: coord)
        cameraUpdate.animation = .fly
        cameraUpdate.animationDuration = 1
        uiView.mapView.moveCamera(cameraUpdate)}
    
}
struct StataionMapView_Previews: PreviewProvider {
    static var previews: some View {
        StationMapView()
    }
}
