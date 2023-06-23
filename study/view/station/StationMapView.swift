//
//  StataionMapView.swift
//  study
//
//  Created by 손찬희 on 2023/05/08.
//

import SwiftUI
import NMapsMap

struct StationMapView: View {
    @StateObject private var viewModel = StationViewModel()
    @State var coord: (Double, Double) = (126.9783881, 37.5666102)
    @State private var isShowingBottomSheet = false
//    @ObservedObject var viewModel = StationViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    Button(action: {
                        isShowingBottomSheet = true
                    }) {
                        Text("O")
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                            .frame(width: 16, height: 16)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                    Button(action: {
                        // 버튼이 눌렸을 때 실행할 액션
                    }) {
                        Text("버튼 텍스트")
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width * 0.7, height: 14)
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
                            Button(action: {
                                // 버튼을 누르면 실행될 액션
                            }) {
                                Image(systemName: "plus")
                                    .font(.system(size: 24))
                                    .foregroundColor(.black)
                            }
                            .frame(width: 64, height: 64)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                        }
                        
                    }
                    .padding(30)
                }
                
            }
            .zIndex(10)
            
            UIMapView(coord: coord)
                .edgesIgnoringSafeArea(.vertical)
                .onAppear {
                    viewModel.fetchStations()
                }
            
        }// zstack
    }
}


// Marker 그리는 로직
struct UIMapView: UIViewRepresentable {
    @EnvironmentObject private var stationDetailModel : StationDetailModel
    var coord: (Double, Double)
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        view.showZoomControls = true
        view.mapView.positionMode = .normal
        view.mapView.zoomLevel = 17
        
        let marker = NMFMarker(position: NMGLatLng(lat: 37.5666102, lng: 126.9783881))
        marker.touchHandler = { (overlay) -> Bool in
            print("마커 터치")
            let markerImage = UIImage(named: "img_marker")
            let batteryCountImage = batteryCountImageMaker(bettryCount: 10)
            let mergeImage = mergeImagesVertically(image1: batteryCountImage, image2: markerImage!)
            stationDetailModel.isBottomSheetShow = true
            marker.iconImage = NMFOverlayImage(image: mergeImage)
            marker.mapView = view.mapView
            
//            AF.request("http://nzeus.zentropy.co.kr/api/station").responseJSON {
//                response in
//                print("Request: \(String(describing: response.request))")   // Original request
//                print("Response: \(String(describing: response.response))")  // url response
//                print("Result: \(response.result)") // response serialization
//            }
            
            let pathOverlay = NMFPath()
            let coordinates: [[Double]] = [
                [126.9783954, 37.5668462],
                [126.9776967, 37.5668621],
                [126.9776347, 37.5669781],
                [126.9776024, 37.5670572],
                [126.9774326, 37.5670574],
                [126.9773896, 37.5670572],
                [126.9773714, 37.5670571],
                [126.9772299, 37.5670538],
                [126.9772341, 37.5672737],
                [126.9772162, 37.5677234],
                [126.9772148, 37.5679217],
                [126.9772142, 37.5680065],
                [126.9771931, 37.5687572],
                [126.9773115, 37.5689993],
                [126.9773621, 37.5690500],
                [126.9774048, 37.5690844],
                [126.9774410, 37.5690999],
                [126.9774874, 37.5691037],
                [126.9776120, 37.5690925],
                [126.9776415, 37.5690900],
                [126.9778726, 37.5690675],
                [126.9778740, 37.5690396],
                [126.9778812, 37.5689829],
                [126.9780045, 37.5686670],
                [126.9780409, 37.5686447],
                [126.9780659, 37.5686340],
                [126.9782596, 37.5686276],
                [126.9783491, 37.5686244],
                [126.9788870, 37.5686150]
            ]


            var latLngArray: [NMGLatLng] = []

            for coordinate in coordinates {
                let lat = coordinate[1]
                let lng = coordinate[0]
                let latLng = NMGLatLng(lat: lat, lng: lng)
                latLngArray.append(latLng)
            }
            pathOverlay.path = NMGLineString(points: latLngArray
            )
//            pathOverlay.patternIcon = NMFOverlayImage(name: "pattern")
            pathOverlay.patternInterval = 3
            pathOverlay.mapView = view.mapView
            return true
        }
        
        let markerImage = UIImage(named: "img_marker")
        let batteryCountImage = batteryCountImageMaker(bettryCount: 20)
        let mergeImage = mergeImagesVertically(image1: batteryCountImage, image2: markerImage!)
        
        marker.iconImage = NMFOverlayImage(image: mergeImage)
//        marker.tag = 2000000
        
        marker.mapView = view.mapView
        return view
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        let coord = NMGLatLng(lat: coord.1, lng: coord.0)
        let cameraUpdate = NMFCameraUpdate(scrollTo: coord)
        cameraUpdate.animation = .fly
        cameraUpdate.animationDuration = 1
        uiView.mapView.moveCamera(cameraUpdate)}
    
//    func addMarker(_ mapView: NMFNaverMapView) {
//        // 마커 생성하기
//        let marker = NMFMarker(position: NMGLatLng(lat: 37.5666102, lng: 126.9783881))
//
//        // 마커 userInfo에 placeId 저장하기
//        marker.userInfo = ["placeId": "test"]
//        marker.mapView = mapView.mapView
//
//        // 터치 이벤트 설정
//
//    }
}

func batteryCountImageMaker(bettryCount : Int) -> UIImage {
    let size = CGSize(width: 30, height: 20)
    let cornerRadius: CGFloat = 10
    
    let renderer = UIGraphicsImageRenderer(size: size)
    let batteryCountImage = renderer.image { context in
        let rect = CGRect(origin: .zero, size: size)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        UIColor(red: 0, green: 208/255, blue: 200/255, alpha: 0.8).setFill()
        path.fill()
        let text = String(bettryCount)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.white
        ]
        let textSize = text.size(withAttributes: attributes)
        let textRect = CGRect(x: rect.midX - textSize.width / 2, y: rect.midY - textSize.height / 2, width: textSize.width, height: textSize.height)
        text.draw(in: textRect, withAttributes: attributes)
    }
    return batteryCountImage
}

func mergeImagesVertically(image1: UIImage, image2: UIImage) -> UIImage {
    let maxHeight = max(image1.size.height, image2.size.height)
    let size = CGSize(width: max(image1.size.width, image2.size.width), height: maxHeight * 2)
    
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    
    let offsetY1 = (maxHeight - image1.size.height) / 2
    let offsetY2 = (maxHeight - image2.size.height-20) / 2
    
    image1.draw(at: CGPoint(x: (size.width - image1.size.width) / 2, y: offsetY1))
    image2.draw(at: CGPoint(x: (size.width - image2.size.width) / 2, y: maxHeight + offsetY2))
    
    let mergedImage = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
    return mergedImage!
}

struct StataionMapView_Previews: PreviewProvider {
    static var previews: some View {
        StationMapView()
    }
}
