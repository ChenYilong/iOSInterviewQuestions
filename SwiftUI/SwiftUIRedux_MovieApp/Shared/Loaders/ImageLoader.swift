//
//  ImageLoader.swift
//  URLImageDemo
//
//  Created by Yilong Chen on 6/17/24.
//  Copyright © 2024 Yilong Chen. All rights reserved.
//

import Foundation

class ImageLoader: ObservableObject {
    
    @Published var downloadedData: Data? = nil
    
    func downloadImage(url: String) {
        
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is not correct")
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = data 
            }
            
        }.resume()
        
    }
    
}
