//
//  ImagePickerViewModel.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 4/2/24.
//

import Foundation
import SwiftUI
import FirebaseStorage

@Observable
class ImagePickerViewModel {
    var showSheet: Bool = false
    var showImagePicker: Bool = false
    var sourceType: UIImagePickerController.SourceType = .camera
    var image: UIImage?
}

