//
//  Restroom.swift
//  RestRoomFinder
//
//  Created by Yilong Chen on 09/06/2024.
//

import Foundation

struct Restroom: Decodable, Identifiable {
    let id: Int
    let name: String?
    let distance: Double
    let street: String
    let city: String
    let state: String
    let accessible: Bool
    let unisex: Bool
    let directions: String?
    let comment: String?
    let latitude: Double
    let longitude: Double
    
    var addess: String {
        "\(street), \(city) \(state)"
    }
    
    static let example = Restroom(
        id: 451,
        name: "Finca Son Verdera Mallorca",
        distance: 0.00014083525406852245,
        street: "en el campo",
        city: "San Francisco",
        state: "CA",
        accessible: true,
        unisex: true,
        directions: "http://www.finca-sonverdera.de",
        comment: "also wlan access",
        latitude: 37.7749295,
        longitude: -122.4194155
    )
}
