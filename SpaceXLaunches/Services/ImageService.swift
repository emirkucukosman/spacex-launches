//
//  ImageService.swift
//  SpaceXLaunches
//
//  Created by Emir Küçükosman on 16.04.2021.
//

import SwiftUI
import Combine

// Credit: https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/

class ImageService: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: UIImage(systemName: "questionmark"))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
    deinit {
        cancel()
    }
}
