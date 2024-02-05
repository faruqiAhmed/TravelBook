//
//  HomeView.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 3/2/24.
//

import SwiftUI
import GoogleMaps
struct GoogleMapview: UIViewRepresentable {
   @ObservedObject  var viewModel: MapViewModel
    private let zoom: Float = 12.0
    func makeUIView(context: Context) -> GMSMapView {
       let camera = GMSCameraPosition.camera(withLatitude: 23.8280, longitude: 90.3640, zoom: zoom)
//       let camera = GMSCameraPosition.camera(withLatitude: viewModel.userLocation?.latitude ?? 0,
//                                             longitude: viewModel.userLocation?.longitude ?? 0,
//                                             zoom: 5)
        let mapView = GMSMapView.map(withFrame: UIScreen.main.bounds, camera: camera)
        mapView.camera = camera
        let mapCenter = CLLocationCoordinate2DMake(mapView.camera.target.latitude, mapView.camera.target.longitude)
               let marker = GMSMarker(position: mapCenter)
               marker.title = "CodeSpeedy Technology"
               marker.snippet = "Web Development & Mobile App Development"
               marker.map = mapView
        mapView.isMyLocationEnabled = true
        mapView.delegate = viewModel
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        let camera = GMSCameraPosition.camera(withLatitude: 23.8280, longitude: 90.3640, zoom: zoom)

     /*   let camera = GMSCameraPosition.camera(withLatitude: viewModel.userLocation?.latitude ?? 0,
                                             longitude: viewModel.userLocation?.longitude ?? 0,
                                              zoom: 15)*/
       uiView.animate(to: camera)
    }
    
}

struct HomeView: View {
    @State var viewModel = ImagePickerViewModel()
    var viewModesl = MapViewModel()
    var body: some View {
            VStack{
                GoogleMapview(viewModel:viewModesl)
            }
            .ignoresSafeArea()
           
        
        /*
            VStack {
                HStack {
                    ForEach (viewModel.retrieveImegaes,id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 100,height: 100)
                    }
                }
                Image(uiImage: viewModel.image ?? UIImage(named: "travel-icon")!)
                    .resizable()
                    .frame(width: 100, height: 100)
                    
                
                Button("Choose Picture") {
                    viewModel.showSheet = true
                }.padding()
                    .actionSheet(isPresented: $viewModel.showSheet) {
                        ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                            .default(Text("Photo Library")) {
                                viewModel.showImagePicker = true
                                viewModel.sourceType = .photoLibrary
                            },
                            .default(Text("Camera")) {
                                viewModel.showImagePicker = true
                                viewModel.sourceType = .camera
                            },
                            .cancel()
                        ])
                }
                
            }
            .sheet(isPresented: $viewModel.showImagePicker) {
                ImagePicker(image: $viewModel.image, isShown: $viewModel.showImagePicker, sourceType: viewModel.sourceType)
        }
            .onAppear {
                viewModel.retrievedImegaes()
            }
        Button("Upload Image") {
            viewModel.uploadImage()
            viewModel.showAlert = true
                    }
        .alert(isPresented: $viewModel.showAlert) {
                   Alert(title: Text("Success"), message: Text("Image uploaded successfully!"), dismissButton: .default(Text("OK")))
               }
         
         */
        VStack(){
                Button(role: .destructive) {
                    do {
                        try AuthService.shared.signOut()
                    } catch {
                        print(error.localizedDescription)
                    }
                } label: {
                    Text("SingOut")
                        .bold()
                        .foregroundStyle(Color("AppColor"))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("AppColor"))
                        }
                }
            }
            .padding()
            .padding(.bottom)
    }

}

#Preview {
    HomeView()
}


