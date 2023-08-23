//
//  CAsyncImage.swift
//  
//
//  Created by Jacklandrin on 2023/8/7.
//

import SwiftUI

public struct CAsyncImage<Placeholder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    private let configuration: (Image) -> Image


    /// Loads and displays an image from the specified URL and it supports cache. The cache can be gained through EnvironmentValue.
    /// - Parameters:
    ///   - url: The URL of the image to display.
    ///   - cache: Image cache. It can be query by URL and return an optional UIImage.
    ///   - placeholder: A Placeholder during loading. This package provides a default value PlaceholderImageView.
    ///   - configuration: The image can be configed in this closure.
    public init(
        url: URL,
        cache: ImageCache? = nil,
        placeholder: Placeholder? = PlaceholderImageView(),
        configuration: @escaping (Image) -> Image = { $0 }
    ) {
        loader = ImageLoader(url: url, cache: cache)
        self.placeholder = placeholder
        self.configuration = configuration
    }

    public var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }

    private var image: some View {
        Group {
            if loader.image != nil {
                configuration(Image(uiImage: loader.image!))
            } else {
                placeholder
            }
        }
    }
}


