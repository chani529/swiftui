import SwiftUI
import NMapsMap

struct ContentView: View {
    @State private var showOverlay = false

    var body: some View {
        NMFNaverMapView(delegate: nil)
            .onAppear {
                let marker = NMFMarker()
                marker.position = NMGLatLng(lat: 37.5666102, lng: 126.9783881)
                marker.mapView = nil // You need to set the map view explicitly

                marker.touchHandler = { [weak self] (overlay) -> Bool in
                    self?.showOverlay = true
                    return true
                }
            }
            .overlay(
                ZStack {
                    if showOverlay {
                        Color.clear
                            .frame(width: 100, height: 100) // 타원형 UI 크기 조정
                            .background(Color.blue)
                            .cornerRadius(50)
                            .overlay(
                                Text("123")
                                    .foregroundColor(.white)
                                    .font(.title)
                            )
                            .position(x: 100, y: 100) // 타원형 UI 위치 조정
                    }
                }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
