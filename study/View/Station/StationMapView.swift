//
//  StataionMapView.swift
//  study
//
//  Created by 손찬희 on 2023/05/08.
//

import SwiftUI
import NMapsMap

struct StationMapView: View {
    @State var coord: (Double, Double) = (126.9784147, 37.5666805)
    var body: some View {
        ZStack {
            VStack {
                Button(action: {coord = (129.05562775, 35.1379222)}) {
                    Text("Move to Busan")
                }
                Button(action: {coord = (127.269311, 37.413294)}) {
                    Text("Move to Seoul somewhere")
                }
                Spacer()
            }
            .zIndex(10)
            
            UIMapView(coord: coord)
                .edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct UIMapView: UIViewRepresentable {
    var coord: (Double, Double)
  
    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        view.showZoomControls = true
        view.mapView.positionMode = .normal
        view.mapView.zoomLevel = 17
      
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
