//
//  ImageLoader.swift
//  
//
//  Created by Jacklandrin on 2023/8/7.
//

import Combine
import UIKit

class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    private(set) var isLoading = false

    private let url: URL
    private var cache: ImageCache?
    private var cancellable: AnyCancellable?

    private static let imageProcessingQueue = DispatchQueue(label: "image-processing")

    init(url: URL, cache: ImageCache? = nil) {
        self.url = url
        self.cache = cache
        if let image = cache?[url] {
            self.image = image
        }
    }

    deinit {
        cancellable?.cancel()
    }

    func load() {
        guard !isLoading else { return }

        if let image = cache?[url] {
            self.image = image
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents(receiveSubscription: { [weak self] _ in self?.onStart() },
                          receiveOutput: { [weak self] in self?.cache($0) },
                          receiveCompletion: { [weak self] _ in self?.onFinish() },
                          receiveCancel: { [weak self] in self?.onFinish() })
            .subscribe(on: Self.imageProcessingQueue)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }

    //cancel task
    func cancel() {
        cancellable?.cancel()
    }

    //mark starting loading
    private func onStart() {
        isLoading = true
    }

    //end loading
    private func onFinish() {
        isLoading = false
    }

    private func cache(_ image: UIImage?) {
        image.map { cache?[url] = $0 }
    }
}

