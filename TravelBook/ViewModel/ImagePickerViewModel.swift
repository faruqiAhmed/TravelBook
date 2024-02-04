//
//  ImagePickerViewModel.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 4/2/24.
//

import Foundation
import SwiftUI
import FirebaseStorage
import Firebase
@Observable
class ImagePickerViewModel {
    var showSheet: Bool = false
    var showImagePicker: Bool = false
    var sourceType: UIImagePickerController.SourceType = .camera
    var image: UIImage?
    var showAlert = false
    var retrieveImegaes = [UIImage]()
    func uploadImage() {
        guard let image = image,let data = image.jpegData(compressionQuality: 0.5) else { return }
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let imageName = UUID().uuidString
        let path = "images/\(imageName).jpg"
        let fileRef = storageRef.child(path)
       fileRef.putData(data, metadata: nil) { metadata, error in
            if error == nil && metadata !=  nil {
                let db = Firestore.firestore()
                db.collection("images").document().setData(["url": path])
               // print("Error uploading image: \(error!.localizedDescription)")
            } else {
                print("Image uploaded successfully!")
            }
        }
    }
    func  retrievedImegaes(){
        let db = Firestore.firestore()
        db.collection("images").getDocuments { snapshot, error in
            var paths = [String]()
    
            if error == nil && snapshot != nil {
                for doc in snapshot!.documents {
                    paths.append(doc["url"] as! String)
                }
                for path in paths {
                    let storageRef = Storage.storage().reference()
                    let fileRef = storageRef.child(path)
                    fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                        if error == nil && data != nil {
                            if let image = UIImage(data: data!) {
                                DispatchQueue.main.async {
                                    self.retrieveImegaes.append(image)
                                }
                            }
                        }
                    }
    
                }
            }
        }
    
    }

}

//class ImageUploadViewModel: ObservableObject {
//    @Published var selectedImage: UIImage?
//
//    func uploadImage() {
//        guard let image = selectedImage,
//              let data = image.jpegData(compressionQuality: 0.5) else { return }
//
//        let storage = Storage.storage()
//        let storageRef = storage.reference()
//
//        let imageName = UUID().uuidString
//        let imageRef = storageRef.child("images/\(imageName).jpg")
//
//        imageRef.putData(data, metadata: nil) { _, error in
//            if let error = error {
//                print("Error uploading image: \(error.localizedDescription)")
//            } else {
//                print("Image uploaded successfully!")
//            }
//        }
//    }
//}
