//
//  AsyncImage.swift
//  SpaceXLaunches
//
//  Created by Emir Küçükosman on 16.04.2021.
//

import SwiftUI

// Credit: https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/

struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageService
    private let placeholder: Placeholder
    
    init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ImageService(url: url))
    }
    
    var body: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image ?? UIImage())
                    .resizable()
            } else {
                placeholder
            }
        }
        .onAppear(perform: {
            loader.load()
        })
    }
}
