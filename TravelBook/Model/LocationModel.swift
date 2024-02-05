//
//  LocationModel.swift
//  TravelBook
//
//  Created by Md Omar Faruq on 5/2/24.
//

import Foundation
struct LocationModel: Identifiable {
    var id = UUID().uuidString
    let title: String
    var imageURL: String
    var latitude: Double
    var longitude: Double
}
