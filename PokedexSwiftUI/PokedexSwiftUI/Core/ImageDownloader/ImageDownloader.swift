//
//  ImageDownloader.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import SwiftUI

final class ImageDownloader: ObservableObject {
    
    // MARK: - Internal Properties

    @Published var image: UIImage?
    var urlString: String?
    var imageCache = DownloadedImageCache.getImageCache()

    // MARK: - Initialization

    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }

    // MARK: - Internal Methods

    func loadImage() {
        if loadImageFromCache() {
            return
        }
        loadImageFromUrl()
    }

    func loadImageFromCache() -> Bool {
        guard
            let urlString = urlString,
            let cacheImage = imageCache.get(forKey: urlString)
        else {
            return false
        }

        image = cacheImage
        return true
    }

    func loadImageFromUrl() {
        guard
            let urlString = urlString,
            let url = URL(string: urlString)
        else { return }

        let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
        task.resume()
    }

    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        guard let data = data else {
            print("No data found")
            return
        }

        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data), let urlString = self.urlString else {
                return
            }
            self.imageCache.set(forKey: urlString, image: loadedImage)
            self.image = loadedImage
        }
    }
}

