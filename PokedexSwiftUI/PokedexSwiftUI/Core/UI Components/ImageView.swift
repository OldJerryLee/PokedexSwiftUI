//
//  ImageView.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Combine
import SwiftUI

struct ImageView: View {

    @ObservedObject var imageLoader: ImageDownloader

    init(withURL url: URL) {
        imageLoader = ImageDownloader(urlString: url.absoluteString)
    }

    var body: some View {
        Image(uiImage: imageLoader.image ?? UIImage() )
            .resizable()
    }
}
