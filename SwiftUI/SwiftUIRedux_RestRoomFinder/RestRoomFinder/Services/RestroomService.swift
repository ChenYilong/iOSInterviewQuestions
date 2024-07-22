//
//  RestroomService.swift
//  RestRoomFinder
//
//  Created by Yilong Chen on 09/06/2024.
//

import Foundation

struct RestroomService {
    
    func getRestRoomByLatLong(lat: Double, long: Double) async throws -> [Restroom]? {
        let urlString = Constants.Urls.restroomsByLatAndLng(lat: lat, lng: long)
        
        logger.debug(urlString)
        
        let restrooms: [Restroom] = try await networkManager.get(urlString: urlString)
        return restrooms
    }
    
    let logger: Logger
    let networkManager: NetworkManager
}
