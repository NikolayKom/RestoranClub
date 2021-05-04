//
//  Restorans.swift
//  RestoranClub
//
//  Created by Николай on 04.05.2021.
//  Copyright © 2021 Kreative Developer. All rights reserved.
//

import Foundation

struct RestorantsResponse: Codable {
    let restorants: [Restoran]
    
    enum CodingKeys: String,CodingKey {
        case restorants = "data"
}
}


struct Restoran: Codable {
    let restaurantName: String
//    let reviews: [String]
    let descriptionRestaurant: String
    let averageCheckRestaurant: Int
    let location: String
//    let rating: Bool
    
    enum CodingKeys: String,CodingKey {
        case restaurantName = "restaurant_name"
//        case reviews
        case descriptionRestaurant = "description_restaurant"
        case averageCheckRestaurant = "average_check_restaurant"
        case location
//        case rating
    }
}