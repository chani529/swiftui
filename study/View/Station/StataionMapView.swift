//
//  StataionMapView.swift
//  study
//
//  Created by 손찬희 on 2023/05/08.
//

import SwiftUI
import NMapsMap

struct StataionMapView: View {
    var body: some View {
        ZStack {
            UIMapView()
                .edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct UIMapView: UIViewRepresentable {
    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        view.showZoomControls = false
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 17
      
        return view
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {}
}

struct StataionMapView_Previews: PreviewProvider {
    static var previews: some View {
        StataionMapView()
    }
}
